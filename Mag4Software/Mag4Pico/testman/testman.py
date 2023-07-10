# testman.py  -- Very simple GUI program to control the stepper motor
# and display the sensor output.  
#
# This code is hardwired for COM7 and COM8.  COM7 should be the
# sensor Raspberry PICO, and COM8 should be the stepper motor PICO.
# 
# This code also assumes that the 3rd Encoder port is the one
# to monitor.


import tkinter as tk
import serial 
import sys

motorport = "COM8"
sensorport = "COM7"
tickspercycle = 200 * 16 * 6  # pules/rev on motor, microsteps, gear ratio

nargs = len(sys.argv) - 1
if nargs <= 0:
    print("Testman for Mag4 Sensor Project.")
    print("Arguments: sensor=xxx motor=xxx")
    print("Where xxx is the com port, such as COM7.")
    print("Arguments are optional. If not given, the")
    print("defauts are COM7 for sensor and COM8 for motor.\n")
    
iarg = 0
while(iarg < nargs): 
    arg = sys.argv[iarg+1]
    iarg += 1
    words = arg.split("=")
    if len(words) != 2: continue
    if words[0]=="sensor": sensorport= words[1] 
    if words[0]=="motor": motorport=words[1]

print("Using Sensor=" + sensorport + "  Motor=" + motorport)

motor_port = serial.Serial(motorport, 115200, timeout=0)
motor_port.write(b"tre1m1s5000!")

sensor_port = serial.Serial(sensorport, 115200, timeout=0)

window = tk.Tk()
window.title(" Test Quad-Mag-Encoder Sensor")
window.geometry("400x300")
label = tk.Label(window, text="Output", font=("Calibri 15 bold"))
label.place(x=10, y=30)

cmd_angle = 0.0
status_line = "Invalid"
char_buffer = ''


def update_sensor_reading():
    global status_line
    global char_buffer
    if sensor_port.in_waiting <= 0: return
    new_chars = sensor_port.read_all().decode('ascii')
    char_buffer = char_buffer + new_chars
    lines = char_buffer.split('\n')
    n = len(lines)
    if n < 2: return
    char_buffer = lines[n - 1]
    cur_line = lines[n - 2]
    words = cur_line.split()
    if len(words) < 14: 
        status_line = "Bad Input"
        return
    count = int(words[10])
    pw = float(words[11])
    period = float(words[12])
    angle = float(words[13])
    status_line = "COUNT=%08d  PW=%6.3f  PER=%6.3f  ANGLE=%8.3f" % (count, pw, period, angle)

def update_status():
    status = "STEP_ANGLE=%5.1f  " % cmd_angle
    update_sensor_reading()
    label["text"] = status + status_line
    window.after(100, update_status)

def move_it(deg):
    global cmd_angle
    cmd_angle = deg
    ticks = tickspercycle * (deg/360)
    cmd = bytes("t%0d!" % ticks, "ascii")
    motor_port.write(cmd)

def move_to_zero():
    move_it(0)
    label["text"] = "Zero"

def move_to_90():
    move_it(90)
    label["text"] = "90"

def move_to_180():
    move_it(180)
    label["text"] = "180"

def move_to_270():
    move_it(270)
    label["text"] = "270"

btn1 = tk.Button(window, text="Move to 0", command=move_to_zero)
btn1.place(x=10, y=80)

btn2 = tk.Button(window, text="Move to 90", command=move_to_90)
btn2.place(x=10, y=110)

btn3 = tk.Button(window, text="Move to 180", command=move_to_180)
btn3.place(x=10, y=140)

btn4 = tk.Button(window, text="Move to 270", command=move_to_270)
btn4.place(x=10, y=170)

update_status()
window.mainloop()

