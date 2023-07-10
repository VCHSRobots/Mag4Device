package frc.robot;

import edu.wpi.first.networktables.GenericEntry;
import edu.wpi.first.wpilibj.SerialPort;
import edu.wpi.first.wpilibj.shuffleboard.BuiltInWidgets;
import edu.wpi.first.wpilibj.shuffleboard.Shuffleboard;
import edu.wpi.first.wpilibj.shuffleboard.ShuffleboardTab;
import frc.robot.Mag4.Mag4Data;
import java.util.Map;

public class Mag4Tester {
    private ShuffleboardTab mainTab; 
    private ShuffleboardTab graphTab;
    private GenericEntry updateCounterEntry;
    private GenericEntry motorDisableEntry;
    private GenericEntry motorStopEntry;
    private GenericEntry motorFreeRunEntry;
    private GenericEntry motorTargetRunEntry;
    private GenericEntry motorDirEntry;
    private GenericEntry motorSpeedEntry;
    private GenericEntry motorPositionEntry;
    private GenericEntry motorTargetEntry;
    private GenericEntry motorSet000Entry;
    private GenericEntry motorSet090Entry;
    private GenericEntry motorSet180Entry;
    private GenericEntry motorSet270Entry;
    private GenericEntry motorResetEntry;
    private GenericEntry[] sensorAnglesEntry = new GenericEntry[4];
    private GenericEntry[] sensorTicksEntry = new GenericEntry[4];
    private GenericEntry[] sensorErrorsEntry = new GenericEntry[4];
    private GenericEntry sensorLimitsEntry;
    private GenericEntry sensorErrorEntry;

    private GenericEntry angleGraphEntry;
    private GenericEntry ticksGraphEntry;
    private GenericEntry positionGraphEntry;

    private SerialPort stepperControlPort;
    private int updateCounter = 0;
    private int motorMode = 0;  // 0=Disabled, 1=Stopped, 2=FreeRun, 3=TargetRun
    private long motorDir  = 0;  // 0=CW, 1=CCW
    private long motorSpeed = 1000;
    private long motorTarget = 0;

    // Variables used to retrieve stepper position from UART
    private long stepperPartValue = 0;
    private int stepperPartSign = 0;
    private boolean stepperInBracket = false;

    // The class for working with the Mag4 Interface device
    private Mag4 mag4 = new Mag4();

    private void setupDashboardTab() {
        int ix = 0;
        int iy = 0;
        mainTab = Shuffleboard.getTab("Mag4");
        graphTab = Shuffleboard.getTab("Mag4_Graph");
        updateCounterEntry = mainTab
            .add("UpdateCounter",  0)
            .withPosition(0, 3)
            .getEntry();
        motorDisableEntry = mainTab
            .add("Motor Disable", true)
            .withWidget(BuiltInWidgets.kToggleButton)
            .withSize(1, 1)
            .withPosition(ix+0, iy+0)
            .getEntry();
        motorStopEntry = mainTab
            .add("Motor Stop", false)
            .withWidget(BuiltInWidgets.kToggleButton)
            .withSize(1,1)
            .withPosition(ix+1, iy+0)
            .getEntry();
        motorFreeRunEntry = mainTab
            .add("Motor Free Run", false)
            .withWidget(BuiltInWidgets.kToggleButton)
            .withSize(1,1)
            .withPosition(ix+2, iy+0)
            .getEntry();
        motorTargetRunEntry = mainTab
            .add("Motor Run To Target", false)
            .withWidget(BuiltInWidgets.kToggleButton)
            .withSize(1,1)
            .withPosition(ix+3, iy+0)
            .getEntry();
        motorDirEntry = mainTab
            .add("Motor Direction", 0)
            .withSize(1,1)
            .withPosition(ix+2, iy+1)
            .getEntry();
        motorSpeedEntry = mainTab
            .add("Motor Speed", 1000)
            .withSize(1,1)
            .withPosition(ix+2, iy+2)
            .getEntry();
        motorPositionEntry = mainTab
            .add("Motor Position", 0)
            .withSize(1,1)
            .withPosition(ix+3, iy+1)
            .getEntry();
        motorTargetEntry = mainTab
            .add("Motor Target", 0)
            .withSize(1,1)
            .withPosition(ix+3, iy+2)
            .getEntry();
        motorSet000Entry = mainTab
            .add("Set 0 Deg", false)
            .withWidget(BuiltInWidgets.kToggleButton)
            .withSize(1,1)
            .withPosition(ix+2, iy+3)
            .getEntry();
        motorSet090Entry = mainTab
            .add("Set 90 Deg", false)
            .withWidget(BuiltInWidgets.kToggleButton)
            .withSize(1,1)
            .withPosition(ix+3, iy+3)
            .getEntry();
        motorSet180Entry = mainTab
            .add("Set 180 Deg", false)
            .withWidget(BuiltInWidgets.kToggleButton)
            .withSize(1,1)
            .withPosition(ix+2, iy+4)
            .getEntry();
        motorSet270Entry = mainTab
            .add("Set 270 Deg", false)
            .withWidget(BuiltInWidgets.kToggleButton)
            .withSize(1,1)
            .withPosition(ix+3, iy+4)
            .getEntry();
        motorResetEntry = mainTab
            .add("Motor Reset", false)
            .withWidget(BuiltInWidgets.kToggleButton)
            .withSize(1,1)
            .withPosition(ix+0, iy+1)
            .getEntry();

        for(int i = 0; i < 4; i++) {
            String name = String.format("Sensor %d", i+1);
            sensorAnglesEntry[i] = mainTab
                .add(name + " Angle", 0.0)
                .withSize(2,2)
                .withPosition(ix+(2*i)+5, iy+0)
                .withWidget("Gyro")
                .getEntry();
            sensorTicksEntry[i] = mainTab 
                .add(name + " Ticks", 0)
                .withSize(1,1)
                .withPosition(ix+(2*i)+5, iy+2)
                .getEntry();
            sensorErrorsEntry[i] = mainTab
                .add(name + " Error", 0)
                .withSize(1,1)
                .withPosition(ix+(2*i)+5, iy+3)
                .getEntry();
        }

        sensorLimitsEntry = mainTab
            .add("Limit Switches", 0)
            .withSize(1,1)
            .withPosition(ix+6, iy+4)
            .getEntry();
        sensorErrorEntry = mainTab
            .add("Mag4 Bus Status", true)
            .withSize(1,1)
            .withPosition(ix+5, iy+4)
            .getEntry();

        angleGraphEntry = graphTab 
            .add("Angle", 0.0)
            .withSize(6,3)
            .withPosition(0, 0)
            .withWidget("Graph")
            .withProperties(Map.of("min", 0.0, "max", 360.0, 
                "Automatic bounds", false, "Upper bound", 360.0, "Lower bound", 0.0))
            .getEntry();
        ticksGraphEntry = graphTab 
            .add("Ticks", 0.0)
            .withSize(6,3)
            .withPosition(0, 3)
            .withWidget("Graph")
            .withProperties(Map.of("min", -10000, "max", 10000, 
                "Automatic bounds", false, "Upper bound", 10000, "Lower bound", -10000))
            .getEntry();
        positionGraphEntry = graphTab 
            .add("Position", 0.0)
            .withSize(6,3)
            .withPosition(0, 6)
            .withWidget("Graph")
            .withProperties(Map.of("min", -10000, "max", 10000, 
                "Automatic bounds", false, "Upper bound", 10000, "Lower bound", -10000))
            .getEntry();
    }

    private void updateSensorUI() {
        Mag4Data d = mag4.getData();
        for (int i = 0; i < 4; i++) {
            sensorAnglesEntry[i].setFloat(d.angles[i]);
            sensorErrorsEntry[i].setFloat(d.errors[i]);
            sensorTicksEntry[i].setInteger(d.ticks[i]);
        }
        angleGraphEntry.setFloat(d.angles[3]);
        ticksGraphEntry.setInteger(d.ticks[3]);
        sensorLimitsEntry.setInteger(d.limitSwitchesByte);
        sensorErrorEntry.setBoolean(!d.buserror);
    }

    private void updateStepperPosition() {
        // Attempt to read the stepper port and decode the position.
        int n = stepperControlPort.getBytesReceived();
        while (n > 0) {
            n -= 1;
            byte[] cc = stepperControlPort.read(1);
            int c = -1;
            if (cc.length > 0) c = (int) (cc[0] & 0x007F);
            if (c == '[') {
                stepperPartValue = 0;
                stepperPartSign = 0;
                stepperInBracket = true;
            }
            if (c == '-' && stepperInBracket) {
                stepperPartSign = 1;
            }
            if (c == ']') {
                long pos = stepperPartValue;
                if (stepperPartSign != 0) pos = -1 * pos;
                motorPositionEntry.setInteger(pos);
                positionGraphEntry.setInteger(pos);
                stepperInBracket = false;
            }
            int digit = c - '0';
            if (digit >= 0 && digit <= 9 && stepperInBracket) {
                stepperPartValue = stepperPartValue * 10 + digit;
            }
        }
    }

    private long getPreset() {
        long preset = -1;
        if (motorSet000Entry.getBoolean(false)) preset =   0;
        if (motorSet090Entry.getBoolean(false)) preset =  90 * 200 * 6 * 16 / 360;
        if (motorSet180Entry.getBoolean(false)) preset = 180 * 200 * 6 * 16 / 360;
        if (motorSet270Entry.getBoolean(false)) preset = 270 * 200 * 6 * 16 / 360;
        if (preset < 0) {
            motorSet000Entry.setBoolean(false);
            motorSet090Entry.setBoolean(false);
            motorSet180Entry.setBoolean(false);
            motorSet270Entry.setBoolean(false);
        }
        return preset;
    }

    private void setModeUI(int mode) {
        if (mode == 0) {
            motorDisableEntry.setBoolean(true);
            motorStopEntry.setBoolean(false);
            motorFreeRunEntry.setBoolean(false);
            motorTargetEntry.setBoolean(false);
        }
        if (mode == 1) {
            motorDisableEntry.setBoolean(false);
            motorStopEntry.setBoolean(true);
            motorFreeRunEntry.setBoolean(false);
            motorTargetEntry.setBoolean(false);
        }
        if (mode == 2) {
            motorDisableEntry.setBoolean(false);
            motorStopEntry.setBoolean(false);
            motorFreeRunEntry.setBoolean(true);
            motorTargetEntry.setBoolean(false);
        }
        if (mode == 3) {
            motorDisableEntry.setBoolean(false);
            motorStopEntry.setBoolean(false);
            motorFreeRunEntry.setBoolean(false);
            motorTargetEntry.setBoolean(true);
        }
    }

    private int motorRPMtoPulsesPerSec(int rpm) {
        // 200 * 16 pulses = one rotation of stepper motor
        // 1:6 gear ratio between stepper and SRX mag encoder
        // Number of pulses for one rotation at SRX = 6*16*200 = 19200
        // 60 RPM = 19200 pulses/sec 
        //  1 RPM =   320 pulses/sec
        int pulses = rpm * 320;
        if (pulses < 0) pulses = 0;
        if (pulses > 6000) pulses = 6000;
        return pulses;
    }

    private void processUI() {
        boolean setMotorParams = false;
        int newmode = motorMode;
        // Do we see a mode change?
        if (motorResetEntry.getBoolean(false)) {
            // we are trying to reset the motor.
            motorMode = 0;
            motorResetEntry.setBoolean(false);
            stepperControlPort.writeString("r0e0m0!");
            return;
        }
        if (motorDisableEntry.getBoolean(false)) newmode = 0;
        if (motorStopEntry.getBoolean(false)) newmode = 1;
        if (motorFreeRunEntry.getBoolean(false)) newmode = 2;
        if (motorTargetRunEntry.getBoolean(false)) newmode = 3;
        if (newmode != motorMode) {
            motorMode = newmode;
            setModeUI(motorMode);
            setMotorParams = true;
        }
        long idir = motorDirEntry.getInteger(0); 
        long ispeed = motorSpeedEntry.getInteger(1000);
        if (motorMode == 2) {
            if (motorDir != idir) setMotorParams = true;
            if (motorSpeed != ispeed) setMotorParams = true;
            motorDir = idir;
            motorSpeed = ispeed;
        }
        long preset = getPreset();
        if (preset >= 0) {
            motorTargetEntry.setInteger(preset);
        }
        long target = motorTargetEntry.getInteger(0);
        if (motorMode == 3) {
            if (motorSpeed != ispeed) setMotorParams = true;
            if (motorTarget != target) setMotorParams = true;
            motorTarget = target;
            motorSpeed = ispeed;
        }
        if (setMotorParams) {
            if (motorMode == 0) stepperControlPort.writeString("e0!");
            if (motorMode == 1) stepperControlPort.writeString("e1s0m0!");
            if (motorMode == 2) {
                int id = 0;
                if (motorDir != 0) id = 1;
                int is = motorRPMtoPulsesPerSec((int) motorSpeed);
                String s = String.format("e1m2s%dd%d!", is, id);
                stepperControlPort.writeString(s);
            }
            if (motorMode == 3) {
                int is = motorRPMtoPulsesPerSec((int) motorSpeed);
                String s = String.format("e1m1s%dt%d!", is, motorTarget);
                stepperControlPort.writeString(s);
            }
        }
    }

// Interface Functions with main Robot Code

    public void robotInit() {
        setupDashboardTab();
        stepperControlPort = new SerialPort(115200, SerialPort.Port.kOnboard);
    }

    public void robotPeriodic() {
        updateCounter += 1;
        if (updateCounter % 10 == 0) {
            // send a ! to get stepper motor status.
            stepperControlPort.writeString("!");
        }
        updateCounterEntry.setInteger(updateCounter);
        updateStepperPosition();
        updateSensorUI();
        processUI();
    }

    public void teleopInit() {

    }

    public void teleopPeriodic() {
    }
}
