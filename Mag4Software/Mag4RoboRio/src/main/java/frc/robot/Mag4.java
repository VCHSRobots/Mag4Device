package frc.robot;

import edu.wpi.first.wpilibj.DigitalOutput;
import edu.wpi.first.wpilibj.SPI;
import edu.wpi.first.wpilibj.SPI.Port;

// The Mag4 class is used to read the Mag4 Interface device over the SPI
// bus.  This code should be copied into a robot program.  
//
// To use a Mag4 device, wire it to the SPI port on the RoboRi, or to 
// the extension port.  Five wires are necessary: Ground, CLK, MOSI, MOSI, and CS.
// Note that the Mag4 and RoboRio both use 3.3 volt signaling.
//
// The default port is port 0 on the RoboRio.  The default constructor
// selects this port.  For a different port, use the appropriate constructor.
//
// Once constructed, the Mag4 object will remain idle until getData() is called.
// getData() uses the SPI bus to return the most up-to-date data avaliable
// at the device.  By oscilloscope measurements, getData will block for about
// 0.3 milliseconds.  Multitasking is not used in this class.
//
// getData() returns a Mag4Data object filled with all the data generated by
// the Mag4 device.  The latency of this data should be less than .4ms!
//
// Written by dlb, July 2023


public class Mag4 {
    // Variables that deal with the SPI Port
    private SPI spi;
    private DigitalOutput timerPin = new DigitalOutput(0);
    boolean toggle_spi_info = false;
    private long bad_transfer_count = 0;
    
    // Variables that contain Sensors Readings
    private int[] sensorTicks = new int[4];
    private float[] sensorAngles = new float[4];
    private float[] sensorErrors = new float[4];
    private int limitSwitches = 0;
    private boolean buserror = true;

    public class Mag4Data {
        public int[] ticks;
        public float[] angles;
        public float[] errors;
        public boolean[] limitSwitches;
        public int limitSwitchesByte;
        public boolean buserror;
        Mag4Data(int[] _ticks, float[] _angles, float[] _errors, int _limits, boolean err) {
            ticks = new int[4];
            angles = new float[4];
            errors = new float[4];
            limitSwitches = new boolean[8];
            for(int i = 0; i < 4; i++) {
                ticks[i] = _ticks[i];
                angles[i] = _angles[i];
                errors[i] = _errors[i];
            }
            limitSwitchesByte = _limits;
            for (int i = 0; i < 8; i++) {
                if (((_limits >> i) & 0x0001) != 0) limitSwitches[i] = false;
                else                                limitSwitches[i] = true;
            }
            buserror = err;
        }
    }

    // Simple Constructor -- uses default on-board SPI port, and no threading.
    public Mag4() {
        setupSPI(Port.kOnboardCS0);
    }

    // Full control Constructor
    public Mag4(SPI.Port port) {
        setupSPI(port);

    }
 
    private void setupSPI(SPI.Port port) {
        spi = new SPI(port);
        spi.setClockRate(1800000);    //2 MHz is PICO Max, 4 MHz is rRIO max
        spi.setMode(SPI.Mode.kMode0);  
        spi.setChipSelectActiveLow();
        System.out.println("Mag 4 Interface set up on SPI.");
    }

    private long testcnt = 0;

    // // For Debugging Purposes
    // private String buftostr(byte[] buf) {
    //     String s = "";
    //     for(int i = 0; i < 30; i++) {
    //         String temp = String.format("%2x ", buf[i]);
    //         s = s + temp;
    //     }
    //     return s;
    // }

    private void fullReadCycle() {
        timerPin.set(true);
        byte[] bufout = new byte[34];
        byte[] bufin  = new byte[34];  
        spi.transaction(bufout, bufin, 32);   // Ask for counts, but discard returned buffer
        decodeEncoderBuffer(bufin);          // Should be decoding angles and limit switches
        timerPin.set(false);
        // testcnt++;
        // if ((testcnt % 100) == 0) {
        //     System.out.println(buftostr(bufin));
        // }
    }

    public Mag4Data getData() {
        fullReadCycle();
        return new Mag4Data(sensorTicks, sensorAngles, sensorErrors, limitSwitches, buserror);
    }

    private void decodeEncoderBuffer(byte[] buf) {
        byte[] subbuf = new byte[4];
        buserror = true; // Assume error
        int indx = 0;
        // Kludge -- look for a 5 as a signature byte.  
        while (true) {
            if (buf[indx++] == 5) break;
            if (indx >= 2) {
                bad_transfer_count++;
                if ((bad_transfer_count % 100) == 1) {
                    String temp = String.format("Bad SPI data transfer for Mag4 interface device. (%d)", bad_transfer_count);
                    System.out.println(temp);
                    return;
                }    
            }
        }
        // Get the tick counts..
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                subbuf[j] = buf[indx];
                indx += 1;
            }
            sensorTicks[i] = toInt4(subbuf);
        }
        // Get the Angles
        for (int i = 0; i < 4; i++) {
            int v = (buf[indx] & 0x00FF) | ((buf[indx + 1] & 0x00FF) << 8);
            indx += 2;
            sensorErrors[i] = 0.0f;                          // Assume no error
            if (v < 0) { v = 0; sensorErrors[i] = 360.0f; }  // Show max error if something wrong
            if (v > 65535) { v = 0; sensorErrors[i] = 360.0f; }
            sensorAngles[i] = 360.0f * ((float) v) / 65536.0f;
        }
        // Get the Errors
        for (int i = 0; i < 4; i++) {
            int v = buf[indx++];
            if (v < 0) v = 255;       // Calculate a max error if something wrong
            if (v > 255) v = 255;
            float err = 360.0f * ((float) v) / 256.0f;
            if (err > sensorErrors[i]) sensorErrors[i] = err;
        }
        // Get the limit Switches
        limitSwitches = buf[indx];
        buserror = false;
    }

    private int toInt4(byte[] buf) {
        int value = 
            ((buf[0] & 0xFF) <<  0) |
            ((buf[1] & 0xFF) <<  8) |
            ((buf[2] & 0xFF) << 16) |
            ((buf[3] & 0xFF) << 24);
        return value;
    }
}
