<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting keepoldvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Dal_V2">
<description>QFN-48  Flat 48 Pin Package 0.4mm Pitch, 0.6x0.6
Trace Sizes: 0.16mm, 0.14mm = 6.2mils, 5.5 mils
Text size: 0.8mm, 20% ratio</description>
<packages>
<package name="RASP_PI_PICO_HOLES">
<pad name="GP9" x="-8.89" y="20.32" drill="1"/>
<pad name="GND3" x="-8.89" y="17.78" drill="1"/>
<pad name="GP10" x="-8.89" y="15.24" drill="1"/>
<pad name="GP11" x="-8.89" y="12.7" drill="1"/>
<pad name="GP12" x="-8.89" y="10.16" drill="1" rot="R90"/>
<pad name="GP13" x="-8.89" y="7.62" drill="1" rot="R90"/>
<pad name="GND4" x="-8.89" y="5.08" drill="1" rot="R90"/>
<pad name="GP14" x="-8.89" y="2.54" drill="1" rot="R90"/>
<pad name="GP15" x="-8.89" y="0" drill="1" rot="R90"/>
<pad name="GP16" x="8.89" y="0" drill="1" rot="R90"/>
<pad name="GP17" x="8.89" y="2.54" drill="1" rot="R90"/>
<pad name="GND5" x="8.89" y="5.08" drill="1" rot="R90"/>
<pad name="GP18" x="8.89" y="7.62" drill="1" rot="R90"/>
<pad name="GP19" x="8.89" y="10.16" drill="1" rot="R90"/>
<pad name="GP20" x="8.89" y="12.7" drill="1" rot="R90"/>
<pad name="GP21" x="8.89" y="15.24" drill="1" rot="R90"/>
<pad name="GND6" x="8.89" y="17.78" drill="1"/>
<pad name="GP22" x="8.89" y="20.32" drill="1"/>
<pad name="RUN" x="8.89" y="22.86" drill="1"/>
<pad name="GP26" x="8.89" y="25.4" drill="1"/>
<pad name="GP27" x="8.89" y="27.94" drill="1"/>
<pad name="GND7" x="8.89" y="30.48" drill="1"/>
<pad name="GP28" x="8.89" y="33.02" drill="1"/>
<pad name="AREF" x="8.89" y="35.56" drill="1"/>
<pad name="3.3_OUT" x="8.89" y="38.1" drill="1"/>
<pad name="3.3_EN" x="8.89" y="40.64" drill="1"/>
<pad name="GND8" x="8.89" y="43.18" drill="1"/>
<pad name="VSYS" x="8.89" y="45.72" drill="1"/>
<pad name="VBUS" x="8.89" y="48.26" drill="1"/>
<wire x1="-10.5" y1="49.63" x2="-10.5" y2="-1.37" width="0.1524" layer="21"/>
<wire x1="-10.5" y1="-1.37" x2="10.5" y2="-1.37" width="0.1524" layer="21"/>
<wire x1="10.5" y1="-1.37" x2="10.5" y2="49.63" width="0.1524" layer="21"/>
<wire x1="10.5" y1="49.63" x2="4" y2="49.63" width="0.1524" layer="21"/>
<text x="-2.54" y="52.07" size="1.27" layer="51" font="vector" ratio="12">&gt;Name</text>
<text x="-3.048" y="-4.445" size="1.27" layer="51" font="vector" ratio="12">&gt;Value</text>
<text x="1.27" y="13.97" size="1.6764" layer="51" font="vector" rot="R90">Raspberry Pi PICO</text>
<circle x="-5.7" y="47.63" radius="1" width="0.1524" layer="21"/>
<circle x="5.7" y="47.63" radius="1" width="0.1524" layer="21"/>
<wire x1="4" y1="49.63" x2="-4" y2="49.63" width="0.1524" layer="21"/>
<wire x1="-4" y1="49.63" x2="-10.5" y2="49.63" width="0.1524" layer="21"/>
<wire x1="-4" y1="49.63" x2="-4" y2="50.5" width="0.1524" layer="21"/>
<wire x1="-4" y1="50.5" x2="4" y2="50.5" width="0.1524" layer="21"/>
<wire x1="4" y1="50.5" x2="4" y2="49.63" width="0.1524" layer="21"/>
<text x="7.62" y="35.941" size="1.016" layer="51" rot="R180">AREF</text>
<text x="7.747" y="33.401" size="1.016" layer="51" rot="R180">GP28</text>
<text x="7.747" y="30.861" size="1.016" layer="51" rot="R180">GND</text>
<text x="7.62" y="28.448" size="1.016" layer="51" rot="R180">GP27</text>
<text x="7.747" y="25.781" size="1.016" layer="51" rot="R180">GP26</text>
<text x="7.747" y="23.368" size="1.016" layer="51" rot="R180">RUN</text>
<text x="7.62" y="20.828" size="1.016" layer="51" rot="R180">GP22</text>
<text x="7.62" y="18.288" size="1.016" layer="51" rot="R180">GND</text>
<text x="7.62" y="15.875" size="1.016" layer="51" rot="R180">GP21</text>
<text x="7.62" y="13.335" size="1.016" layer="51" rot="R180">GP20</text>
<text x="7.62" y="10.668" size="1.016" layer="51" rot="R180">GP19</text>
<text x="7.62" y="8.128" size="1.016" layer="51" rot="R180">GP18</text>
<text x="7.62" y="5.588" size="1.016" layer="51" rot="R180">GND</text>
<text x="7.62" y="3.4544" size="1.016" layer="51" rot="R180">GP17</text>
<text x="7.5946" y="1.7272" size="1.016" layer="51" rot="R180">GP16</text>
<text x="-7.62" y="12.319" size="1.016" layer="51">GP11</text>
<text x="-7.62" y="14.732" size="1.016" layer="51">GP10</text>
<text x="-7.62" y="17.272" size="1.016" layer="51">GND</text>
<text x="-7.62" y="19.939" size="1.016" layer="51">GP9</text>
<text x="-7.62" y="22.479" size="1.016" layer="51">GP8</text>
<text x="-7.62" y="25.019" size="1.016" layer="51">GP7</text>
<text x="-7.62" y="27.559" size="1.016" layer="51">GP6</text>
<text x="-7.62" y="30.099" size="1.016" layer="51">GND</text>
<text x="-7.62" y="32.639" size="1.016" layer="51">GP5</text>
<text x="-7.62" y="35.179" size="1.016" layer="51">GP4</text>
<text x="-7.62" y="37.719" size="1.016" layer="51">GP3</text>
<text x="-7.62" y="40.259" size="1.016" layer="51">GP2</text>
<text x="-7.62" y="42.799" size="1.016" layer="51">GND</text>
<text x="-7.62" y="45.339" size="1.016" layer="51">GP1</text>
<pad name="GP8" x="-8.89" y="22.86" drill="1"/>
<pad name="GP7" x="-8.89" y="25.4" drill="1"/>
<pad name="GP6" x="-8.89" y="27.94" drill="1"/>
<pad name="GND2" x="-8.89" y="30.48" drill="1"/>
<pad name="GP5" x="-8.89" y="33.02" drill="1"/>
<pad name="GP4" x="-8.89" y="35.56" drill="1"/>
<pad name="GP3" x="-8.89" y="38.1" drill="1"/>
<pad name="GP2" x="-8.89" y="40.64" drill="1"/>
<pad name="GND1" x="-8.89" y="43.18" drill="1"/>
<pad name="GP1" x="-8.89" y="45.72" drill="1"/>
<pad name="GP0" x="-8.89" y="48.26" drill="1"/>
<text x="-7.62" y="9.779" size="1.016" layer="51">GP12</text>
<text x="-7.62" y="7.239" size="1.016" layer="51">GP13</text>
<text x="-7.62" y="4.699" size="1.016" layer="51">GND</text>
<text x="-7.62" y="2.667" size="1.016" layer="51">GP14</text>
<text x="-7.6708" y="0.8636" size="1.016" layer="51">GP15</text>
<text x="7.62" y="38.481" size="1.016" layer="51" rot="R180">3_OUT</text>
<text x="7.62" y="41.021" size="1.016" layer="51" rot="R180">3_EN</text>
<text x="7.62" y="43.561" size="1.016" layer="51" rot="R180">GND</text>
<text x="7.62" y="46.101" size="1.016" layer="51" rot="R180">VSYS</text>
<text x="7.62" y="48.641" size="1.016" layer="51" rot="R180">VBUS</text>
<pad name="SWDIO" x="2.54" y="0.23" drill="1" rot="R90"/>
<pad name="GND_DEG" x="0" y="0.23" drill="1" rot="R90"/>
<pad name="SWCLK" x="-2.54" y="0.23" drill="1" rot="R90"/>
<circle x="-5.7" y="0.63" radius="1" width="0.127" layer="51"/>
<circle x="5.7" y="0.63" radius="1" width="0.127" layer="51"/>
<text x="-7.62" y="47.879" size="1.016" layer="51">GP0</text>
</package>
<package name="RASP_PI_PICO_SMD">
<smd name="P$1" x="0" y="0" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$2" x="0" y="-2.54" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$3" x="0" y="-5.08" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$4" x="0" y="-7.62" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$5" x="0" y="-10.16" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$6" x="0" y="-12.7" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$7" x="0" y="-15.24" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$8" x="0" y="-17.78" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$9" x="0" y="-20.32" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$10" x="0" y="-22.86" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$11" x="0" y="-25.4" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$12" x="0" y="-27.94" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$13" x="0" y="-30.48" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$14" x="0" y="-33.02" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$15" x="0" y="-35.56" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$16" x="0" y="-38.1" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$17" x="0" y="-40.64" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$18" x="0" y="-43.18" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$19" x="0" y="-45.72" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$20" x="0" y="-48.26" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$21" x="19.38" y="-48.26" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$22" x="19.38" y="-45.72" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$23" x="19.38" y="-43.18" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$24" x="19.38" y="-40.64" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$25" x="19.38" y="-38.1" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$26" x="19.38" y="-35.56" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$27" x="19.38" y="-33.02" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$28" x="19.38" y="-30.48" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$29" x="19.38" y="-27.94" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$30" x="19.38" y="-25.4" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$31" x="19.38" y="-22.86" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$32" x="19.38" y="-20.32" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$33" x="19.38" y="-17.78" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$34" x="19.38" y="-15.24" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$35" x="19.38" y="-12.7" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$36" x="19.38" y="-10.16" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$37" x="19.38" y="-7.62" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$38" x="19.38" y="-5.08" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$39" x="19.38" y="-2.54" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$40" x="19.38" y="0" dx="3.2" dy="1.6" layer="1"/>
<smd name="P$41" x="7.15" y="-48.83" dx="3.2" dy="1.6" layer="1" rot="R90"/>
<smd name="P$42" x="9.69" y="-48.83" dx="3.2" dy="1.6" layer="1" rot="R90"/>
<smd name="P$43" x="12.23" y="-48.83" dx="3.2" dy="1.6" layer="1" rot="R90"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-45.72" width="0.127" layer="21"/>
<wire x1="2.54" y1="-45.72" x2="16.51" y2="-45.72" width="0.127" layer="21"/>
<wire x1="16.51" y1="-45.72" x2="16.51" y2="1.27" width="0.127" layer="21"/>
<wire x1="6.35" y1="2.54" x2="12.7" y2="2.54" width="0.127" layer="21"/>
<text x="6.35" y="-15.24" size="1.27" layer="25">&gt;Name</text>
<text x="6.35" y="-17.78" size="1.27" layer="27">&gt;Value</text>
<text x="10.16" y="-36.83" size="1.27" layer="51" rot="R90">Rasp Pi PICO</text>
<wire x1="2.54" y1="1.37" x2="16.51" y2="1.37" width="0.127" layer="21"/>
<wire x1="6.35" y1="2.54" x2="6.35" y2="1.27" width="0.127" layer="21"/>
<wire x1="12.7" y1="2.54" x2="12.7" y2="1.27" width="0.127" layer="21"/>
</package>
<package name="PINHDR_SMD_050_5X2">
<description>Pin header, SMT, 0.05 Pitch, 2x5</description>
<smd name="1" x="0" y="-2.54" dx="0.76" dy="2.4" layer="1"/>
<smd name="2" x="0" y="2.54" dx="0.76" dy="2.4" layer="1"/>
<smd name="3" x="1.27" y="-2.54" dx="0.76" dy="2.4" layer="1"/>
<smd name="4" x="1.27" y="2.54" dx="0.76" dy="2.4" layer="1"/>
<smd name="5" x="2.54" y="-2.54" dx="0.76" dy="2.4" layer="1"/>
<smd name="6" x="2.54" y="2.54" dx="0.76" dy="2.4" layer="1"/>
<smd name="7" x="3.81" y="-2.54" dx="0.76" dy="2.4" layer="1"/>
<smd name="8" x="3.81" y="2.54" dx="0.76" dy="2.4" layer="1"/>
<smd name="9" x="5.08" y="-2.54" dx="0.76" dy="2.4" layer="1"/>
<smd name="10" x="5.08" y="2.54" dx="0.76" dy="2.4" layer="1"/>
<text x="0.365" y="4.5" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="0.4" y="-5.3" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<text x="-1.7" y="-3.5" size="1.27" layer="21">1</text>
<circle x="1.27" y="0.635" radius="0.1905" width="0.16" layer="51"/>
<circle x="2.54" y="0.635" radius="0.1905" width="0.16" layer="51"/>
<circle x="3.81" y="0.635" radius="0.1905" width="0.16" layer="51"/>
<circle x="5.08" y="0.635" radius="0.193125" width="0.16" layer="51"/>
<circle x="5.08" y="-0.635" radius="0.1905" width="0.16" layer="51"/>
<circle x="3.81" y="-0.635" radius="0.1905" width="0.16" layer="51"/>
<circle x="2.54" y="-0.635" radius="0.1905" width="0.16" layer="51"/>
<circle x="1.27" y="-0.635" radius="0.1905" width="0.16" layer="51"/>
<circle x="0" y="-0.635" radius="0.1905" width="0.16" layer="51"/>
<circle x="0" y="0.635" radius="0.193125" width="0.16" layer="51"/>
<circle x="-0.9525" y="-4.445" radius="0.299528125" width="0.16" layer="21"/>
<circle x="-0.9525" y="-4.445" radius="0.170978125" width="0.16" layer="21"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-2.54" x2="8.89" y2="2.54" width="0.2032" layer="21"/>
<wire x1="-3.81" y1="2.54" x2="-1.27" y2="2.54" width="0.2032" layer="21"/>
<wire x1="8.89" y1="2.54" x2="6.35" y2="2.54" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-2.54" x2="6.35" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="-3.81" y1="-2.54" x2="-2.54" y2="-2.54" width="0.2032" layer="21"/>
</package>
<package name="PINHDR_TH_098_1X3">
<wire x1="4" y1="1.6" x2="-4" y2="1.6" width="0.254" layer="21"/>
<wire x1="-4" y1="1.6" x2="-4" y2="-1.5" width="0.254" layer="21"/>
<wire x1="-4" y1="-1.5" x2="4" y2="-1.5" width="0.254" layer="21"/>
<wire x1="4" y1="-1.5" x2="4" y2="1.6" width="0.254" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="1"/>
<pad name="2" x="0" y="0" drill="1"/>
<pad name="3" x="2.5" y="0" drill="1"/>
<text x="0.1664" y="1.9974" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.64" y="-2.621" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="-0.4" y="-2.8" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
</package>
<package name="PINHDR_TH_100_1X3">
<pad name="1" x="-2.54" y="0" drill="1"/>
<pad name="2" x="0" y="0" drill="1"/>
<pad name="3" x="2.54" y="0" drill="1"/>
<text x="-2.43" y="-2.675" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="-4.44" y="-1.77" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<wire x1="-4.054" y1="1.524" x2="4.074" y2="1.524" width="0.16" layer="21"/>
<wire x1="4.074" y1="1.524" x2="4.074" y2="-1.524" width="0.16" layer="21"/>
<wire x1="4.074" y1="-1.524" x2="-4.054" y2="-1.524" width="0.16" layer="21"/>
<wire x1="-4.054" y1="-1.524" x2="-4.054" y2="1.524" width="0.16" layer="21"/>
<text x="5.2" y="-2.33" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="PINHDR_TH_156_1X3">
<wire x1="-6" y1="2" x2="-5" y2="2" width="0.16" layer="21"/>
<wire x1="-5" y1="2" x2="5" y2="2" width="0.16" layer="21"/>
<wire x1="5" y1="2" x2="6" y2="2" width="0.16" layer="21"/>
<wire x1="-5" y1="2" x2="-5" y2="4" width="0.16" layer="21"/>
<wire x1="-5" y1="4" x2="5" y2="4" width="0.16" layer="21"/>
<wire x1="5" y1="4" x2="5" y2="2" width="0.16" layer="21"/>
<wire x1="-6" y1="2" x2="-6" y2="-4" width="0.16" layer="21"/>
<wire x1="-6" y1="-4" x2="6" y2="-4" width="0.16" layer="21"/>
<wire x1="6" y1="-4" x2="6" y2="2" width="0.16" layer="21"/>
<pad name="1" x="-3.9624" y="0" drill="1.4"/>
<pad name="2" x="0" y="0" drill="1.4"/>
<pad name="3" x="3.9624" y="0" drill="1.4"/>
<text x="-5.6" y="2.5" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="-6.3" y="-2.7" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<text x="7.12" y="-3.36" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="JST-XH_098_VERT_1X3">
<description>JST Connector, XH Series, 0.098 Inch, 1x3</description>
<pad name="3" x="-5" y="0" drill="1"/>
<pad name="2" x="-2.5" y="0" drill="1"/>
<pad name="1" x="0" y="0" drill="1" shape="square"/>
<text x="1.9162" y="-1.4126" size="1.27" layer="51" font="vector" ratio="12" rot="R180">1</text>
<text x="-8.04" y="-3.21" size="1.27" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<wire x1="2.5" y1="-3.5" x2="2.5" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-7.5" y1="2.5" x2="-7.5" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="-7.5" y1="-3.5" x2="2.5" y2="-3.5" width="0.1524" layer="21"/>
<text x="-6.451" y="-5.157" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<wire x1="2.5" y1="2.5" x2="1" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-1" y1="2.5" x2="-4" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-7.5" y1="2.5" x2="-6" y2="2.5" width="0.1524" layer="21"/>
</package>
<package name="TERMBLOCK_TH_200_1X3">
<pad name="P$1" x="0" y="0" drill="1.6"/>
<pad name="P$2" x="5.08" y="0" drill="1.6"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="12.7" y2="5.08" width="0.1524" layer="21"/>
<wire x1="12.7" y1="5.08" x2="12.7" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-5.08" x2="-2.54" y2="-5.08" width="0.1524" layer="21"/>
<text x="-1.27" y="6.35" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-7.62" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-1.27" y="-2.54" size="1.27" layer="21">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.6"/>
</package>
<package name="PH2_TH_SIDE_200_1X3">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.4"/>
<pad name="P$2" x="5.08" y="0" drill="1.4"/>
<wire x1="-3.175" y1="-2.794" x2="-3.175" y2="7.874" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="7.874" x2="13.335" y2="7.874" width="0.1524" layer="21"/>
<wire x1="13.335" y1="7.874" x2="13.335" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-2.794" x2="-3.175" y2="-2.794" width="0.1524" layer="21"/>
<text x="-3.81" y="8.89" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-3.81" y="-5.08" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="PA$1" x="0" y="5.08" drill="1.4"/>
<pad name="PA$2" x="5.08" y="5.08" drill="1.4"/>
<wire x1="0" y1="5.08" x2="0" y2="0" width="0.3048" layer="1"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="0" width="0.3048" layer="1"/>
<pad name="P$3" x="10.16" y="0" drill="1.4"/>
<pad name="PA$3" x="10.16" y="5.08" drill="1.4"/>
<wire x1="10.16" y1="5.08" x2="10.16" y2="0" width="0.3048" layer="1"/>
</package>
<package name="PHOENIX_TH_SIDE_200_1X3">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.5"/>
<pad name="P$2" x="5.08" y="0" drill="1.5"/>
<wire x1="-3.048" y1="-9.779" x2="-3.048" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="2.032" x2="13.462" y2="2.032" width="0.1524" layer="21"/>
<wire x1="13.462" y1="2.032" x2="13.462" y2="-9.779" width="0.1524" layer="21"/>
<wire x1="13.462" y1="-9.779" x2="-3.048" y2="-9.779" width="0.1524" layer="21"/>
<text x="-1.27" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-3.81" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.5"/>
</package>
<package name="PINHDR_TH_098_1X2">
<wire x1="2.75" y1="2" x2="-2.85" y2="2" width="0.254" layer="21"/>
<wire x1="-2.85" y1="2" x2="-2.85" y2="-2" width="0.254" layer="21"/>
<wire x1="-2.85" y1="-2" x2="2.75" y2="-2" width="0.254" layer="21"/>
<wire x1="2.75" y1="-2" x2="2.75" y2="2" width="0.254" layer="21"/>
<pad name="1" x="-1.25" y="0" drill="1"/>
<pad name="2" x="1.25" y="0" drill="1"/>
<text x="-3.29" y="-1.74" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<text x="-1.1704" y="-3.2668" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="4.15" y="-2.2" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="PINHDR_TH_100_1X2">
<wire x1="3.185" y1="1.905" x2="-3.165" y2="1.905" width="0.16" layer="21"/>
<wire x1="-3.165" y1="1.905" x2="-3.165" y2="-1.905" width="0.16" layer="21"/>
<wire x1="-3.165" y1="-1.905" x2="3.185" y2="-1.905" width="0.16" layer="21"/>
<wire x1="3.185" y1="-1.905" x2="3.185" y2="1.905" width="0.16" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1"/>
<pad name="2" x="1.27" y="0" drill="1"/>
<text x="-3.54" y="-1.74" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<text x="-1.2" y="-3.075" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="4.4" y="-2.1" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="JST-XH_098_VERT_1X2">
<description>JST Connector, XH Series, 0.098 Inch, 1x2</description>
<pad name="1" x="0" y="0" drill="1" shape="square"/>
<pad name="2" x="-2.5" y="0" drill="1"/>
<text x="1.5072" y="-1.2796" size="1.27" layer="21" ratio="12" rot="R180">1</text>
<text x="-5.517" y="-3.394" size="1.27" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<wire x1="2.45" y1="2.5" x2="2.45" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="2.45" y1="-3.5" x2="-4.95" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="-4.95" y1="-3.5" x2="-4.95" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-4.95" y1="2.5" x2="-3.15" y2="2.5" width="0.1524" layer="21"/>
<wire x1="2.45" y1="2.5" x2="0.45" y2="2.5" width="0.1524" layer="21"/>
<text x="-4.417" y="-5.235" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
</package>
<package name="JST-XH_098_HORZ_1X2">
<description>XH Connector, 2 Position, Through Hole, Right Angle
Taked from XH Connector Documnet.  Model No. S2B-XH-A.</description>
<pad name="2" x="-1.25" y="0" drill="1"/>
<pad name="1" x="1.25" y="0" drill="1" shape="square"/>
<wire x1="-3.7" y1="9.2" x2="3.7" y2="9.2" width="0.1" layer="51"/>
<wire x1="-3.7" y1="-2.3" x2="-3.3" y2="-2.3" width="0.1" layer="51"/>
<wire x1="3.3" y1="-2.3" x2="3.7" y2="-2.3" width="0.1" layer="51"/>
<wire x1="3.7" y1="-2.3" x2="3.7" y2="9.2" width="0.1" layer="51"/>
<wire x1="-3.7" y1="-2.3" x2="-3.7" y2="9.2" width="0.1" layer="51"/>
<wire x1="-3.3" y1="0.3" x2="-2.4" y2="0.3" width="0.1524" layer="51"/>
<wire x1="-2.4" y1="0.3" x2="-2.4" y2="1.3" width="0.1524" layer="51"/>
<wire x1="-2.4" y1="1.3" x2="-0.2" y2="1.3" width="0.1524" layer="51"/>
<wire x1="-0.2" y1="1.3" x2="-0.2" y2="0.3" width="0.1524" layer="51"/>
<wire x1="-0.2" y1="0.3" x2="0.2" y2="0.3" width="0.1524" layer="51"/>
<wire x1="0.2" y1="0.3" x2="0.2" y2="1.3" width="0.1524" layer="51"/>
<wire x1="0.2" y1="1.3" x2="2.4" y2="1.3" width="0.1524" layer="51"/>
<wire x1="2.4" y1="1.3" x2="2.4" y2="0.3" width="0.1524" layer="51"/>
<wire x1="2.4" y1="0.3" x2="3.3" y2="0.3" width="0.1524" layer="51"/>
<wire x1="3.3" y1="0.3" x2="3.3" y2="-2.3" width="0.1" layer="51"/>
<wire x1="-3.3" y1="0.3" x2="-3.3" y2="-2.3" width="0.1" layer="51"/>
<text x="2.564" y="-1.927" size="1.27" layer="51" font="vector" ratio="12" rot="R90">1</text>
<text x="-2.856" y="6.613" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-3.229" y="3.863" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<wire x1="3.7" y1="-2.3" x2="3.7" y2="9.2" width="0.1524" layer="21"/>
<wire x1="3.7" y1="9.2" x2="-3.7" y2="9.2" width="0.1524" layer="21"/>
<wire x1="-3.7" y1="9.2" x2="-3.7" y2="-2.3" width="0.1524" layer="21"/>
<wire x1="-3.7" y1="-2.3" x2="-3.3" y2="-2.3" width="0.16" layer="21"/>
<wire x1="-3.3" y1="-2.3" x2="-3.3" y2="0.3" width="0.1524" layer="21"/>
<wire x1="3.7" y1="-2.3" x2="3.3" y2="-2.3" width="0.1524" layer="21"/>
<wire x1="3.3" y1="-2.3" x2="3.3" y2="0.3" width="0.1524" layer="21"/>
</package>
<package name="TERMBLOCK_TH_200_1X2">
<pad name="P$1" x="0" y="0" drill="1.6"/>
<pad name="P$2" x="5.08" y="0" drill="1.6"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="7.62" y2="5.08" width="0.1524" layer="21"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-5.08" x2="-2.54" y2="-5.08" width="0.1524" layer="21"/>
<text x="-1.27" y="6.35" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-7.62" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-1.27" y="-2.54" size="1.27" layer="21">1</text>
</package>
<package name="PH2_TH_SIDE_200_1X2">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.4"/>
<pad name="P$2" x="5.08" y="0" drill="1.4"/>
<wire x1="-3.175" y1="-2.794" x2="-3.175" y2="7.874" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="7.874" x2="8.255" y2="7.874" width="0.1524" layer="21"/>
<wire x1="8.255" y1="7.874" x2="8.255" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.794" x2="-3.175" y2="-2.794" width="0.1524" layer="21"/>
<text x="-3.81" y="8.89" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-3.81" y="-5.08" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="PA$1" x="0" y="5.08" drill="1.4"/>
<pad name="PA$2" x="5.08" y="5.08" drill="1.4"/>
<wire x1="0" y1="5.08" x2="0" y2="0" width="0.3048" layer="1"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="0" width="0.3048" layer="1"/>
</package>
<package name="PHOENIX_TH_SIDE_200_1X2">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.5"/>
<pad name="P$2" x="5.08" y="0" drill="1.5"/>
<wire x1="-3.048" y1="-9.779" x2="-3.048" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="2.032" x2="8.382" y2="2.032" width="0.1524" layer="21"/>
<wire x1="8.382" y1="2.032" x2="8.382" y2="-9.779" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-9.779" x2="-3.048" y2="-9.779" width="0.1524" layer="21"/>
<text x="-1.27" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-3.81" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
</package>
<package name="TO252-3">
<description>&lt;b&gt;SMALL OUTLINE TRANSISTOR&lt;/b&gt;&lt;p&gt;
TS-003 T0252, TO252-3 
DPAK Recommended footport from ST</description>
<wire x1="3.2766" y1="3.8354" x2="3.277" y2="-2.159" width="0.2032" layer="51"/>
<wire x1="3.277" y1="-2.159" x2="-3.277" y2="-2.159" width="0.2032" layer="51"/>
<wire x1="-3.277" y1="-2.159" x2="-3.2766" y2="3.8354" width="0.2032" layer="51"/>
<wire x1="-3.277" y1="3.835" x2="3.2774" y2="3.8346" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="3.937" x2="-2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="4.6482" x2="-2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="-2.1082" y1="5.1054" x2="2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="2.1082" y1="5.1054" x2="2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="4.6482" x2="2.5654" y2="3.937" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="3.937" x2="-2.5654" y2="3.937" width="0.2032" layer="51"/>
<smd name="FIN" x="0" y="2.5" dx="6.3" dy="6.1" layer="1"/>
<smd name="1" x="-2.28" y="-3.8" dx="1.5" dy="2.8" layer="1"/>
<smd name="3" x="2.28" y="-3.8" dx="1.5" dy="2.8" layer="1"/>
<text x="-3.81" y="-2.54" size="1.27" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.27" layer="27" font="vector" ratio="12" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.7178" y1="-5.1562" x2="-1.8542" y2="-2.2606" layer="51"/>
<rectangle x1="1.8542" y1="-5.1562" x2="2.7178" y2="-2.2606" layer="51"/>
<rectangle x1="-0.4318" y1="-3.0226" x2="0.4318" y2="-2.2606" layer="51"/>
<polygon width="0.1998" layer="51">
<vertex x="-2.5654" y="3.937"/>
<vertex x="-2.5654" y="4.6482"/>
<vertex x="-2.1082" y="5.1054"/>
<vertex x="2.1082" y="5.1054"/>
<vertex x="2.5654" y="4.6482"/>
<vertex x="2.5654" y="3.937"/>
</polygon>
</package>
<package name="TO252-3-HS">
<description>&lt;b&gt;SMALL OUTLINE TRANSISTOR&lt;/b&gt;&lt;p&gt;
TS-003 T0252, TO252-3 
DPAK Recommended footport from ST
With Solder On Heat Sink from AAVID PN: 573100D00010G</description>
<wire x1="3.2766" y1="3.8354" x2="3.277" y2="-2.159" width="0.2032" layer="51"/>
<wire x1="3.277" y1="-2.159" x2="-3.277" y2="-2.159" width="0.2032" layer="51"/>
<wire x1="-3.277" y1="-2.159" x2="-3.2766" y2="3.8354" width="0.2032" layer="51"/>
<wire x1="-3.277" y1="3.835" x2="3.2774" y2="3.8346" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="3.937" x2="-2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="4.6482" x2="-2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="-2.1082" y1="5.1054" x2="2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="2.1082" y1="5.1054" x2="2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="4.6482" x2="2.5654" y2="3.937" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="3.937" x2="-2.5654" y2="3.937" width="0.2032" layer="51"/>
<smd name="FIN" x="0" y="2.5" dx="6.3" dy="6.1" layer="1"/>
<smd name="1" x="-2.28" y="-3.8" dx="1.5" dy="2.8" layer="1"/>
<smd name="3" x="2.28" y="-3.8" dx="1.5" dy="2.8" layer="1"/>
<text x="-2.54" y="6.35" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="8.89" y="-0.635" size="1.27" layer="27" font="vector" ratio="12" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.7178" y1="-5.1562" x2="-1.8542" y2="-2.2606" layer="51"/>
<rectangle x1="1.8542" y1="-5.1562" x2="2.7178" y2="-2.2606" layer="51"/>
<rectangle x1="-0.4318" y1="-3.0226" x2="0.4318" y2="-2.2606" layer="51"/>
<polygon width="0.1998" layer="51">
<vertex x="-2.5654" y="3.937"/>
<vertex x="-2.5654" y="4.6482"/>
<vertex x="-2.1082" y="5.1054"/>
<vertex x="2.1082" y="5.1054"/>
<vertex x="2.5654" y="4.6482"/>
<vertex x="2.5654" y="3.937"/>
</polygon>
<rectangle x1="-6.985" y1="-1.27" x2="6.985" y2="8.382" layer="1"/>
<rectangle x1="-6.731" y1="-0.889" x2="-5.207" y2="8.128" layer="29"/>
<rectangle x1="5.207" y1="-0.889" x2="6.731" y2="8.128" layer="29"/>
<rectangle x1="-6.604" y1="-0.762" x2="-5.334" y2="8.001" layer="31"/>
<rectangle x1="5.334" y1="-0.762" x2="6.604" y2="8.001" layer="31"/>
</package>
<package name="CAP200">
<wire x1="1.27" y1="0" x2="1.905" y2="0" width="0.4064" layer="21"/>
<wire x1="1.905" y1="0" x2="1.905" y2="0.635" width="0.4064" layer="21"/>
<wire x1="1.905" y1="0" x2="1.905" y2="-0.635" width="0.4064" layer="21"/>
<wire x1="3.81" y1="0" x2="3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="3.175" y1="0" x2="3.175" y2="0.635" width="0.4064" layer="21"/>
<wire x1="3.175" y1="0" x2="3.175" y2="-0.635" width="0.4064" layer="21"/>
<pad name="1" x="0" y="0" drill="0.9"/>
<pad name="2" x="5.08" y="0" drill="0.9"/>
<text x="0.73" y="1.54" size="0.8" layer="25" font="vector" ratio="15">&gt;Name</text>
<text x="0.53" y="-2.21" size="0.8" layer="27" font="vector" ratio="15">&gt;Value</text>
</package>
<package name="CAP300">
<wire x1="1.27" y1="0" x2="3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="3.175" y1="0" x2="3.175" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="3.175" y1="0" x2="3.175" y2="1.27" width="0.4064" layer="21"/>
<wire x1="4.445" y1="1.27" x2="4.445" y2="0" width="0.4064" layer="21"/>
<wire x1="4.445" y1="0" x2="4.445" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="4.445" y1="0" x2="6.35" y2="0" width="0.4064" layer="21"/>
<pad name="1" x="0" y="0" drill="0.9"/>
<pad name="2" x="7.62" y="0" drill="0.9"/>
<text x="2.03" y="2.04" size="0.8" layer="25" font="vector" ratio="15">&gt;Name</text>
<text x="1.63" y="-2.81" size="0.8" layer="27" font="vector" ratio="15">&gt;Value</text>
</package>
<package name="C0402">
<description>INCH=0402, METRIC=1005
From TDK Land Recommendation for Commercial Grade, up to 630 Volts.</description>
<smd name="1" x="-0.5" y="0" dx="0.4" dy="0.6" layer="1"/>
<smd name="2" x="0.5" y="0" dx="0.4" dy="0.6" layer="1"/>
<text x="-1.735" y="0.635" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.135" y="-1.405" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<rectangle x1="-0.15" y1="-0.3" x2="0.15" y2="0.3" layer="35"/>
<wire x1="-0.3" y1="0.4" x2="-0.8" y2="0.4" width="0.16" layer="21"/>
<wire x1="-0.8" y1="0.4" x2="-0.8" y2="-0.4" width="0.16" layer="21"/>
<wire x1="-0.8" y1="-0.4" x2="-0.3" y2="-0.4" width="0.16" layer="21"/>
<wire x1="0.3" y1="0.4" x2="0.8" y2="0.4" width="0.16" layer="21"/>
<wire x1="0.8" y1="0.4" x2="0.8" y2="-0.4" width="0.16" layer="21"/>
<wire x1="0.8" y1="-0.4" x2="0.3" y2="-0.4" width="0.16" layer="21"/>
<wire x1="-0.5" y1="0.25" x2="-0.4" y2="0.25" width="0.1" layer="51"/>
<wire x1="-0.4" y1="0.25" x2="0.4" y2="0.25" width="0.1" layer="51"/>
<wire x1="0.4" y1="0.25" x2="0.5" y2="0.25" width="0.1" layer="51"/>
<wire x1="0.5" y1="0.25" x2="0.5" y2="-0.25" width="0.1" layer="51"/>
<wire x1="0.5" y1="-0.25" x2="0.4" y2="-0.25" width="0.1" layer="51"/>
<wire x1="0.4" y1="-0.25" x2="-0.4" y2="-0.25" width="0.1" layer="51"/>
<wire x1="-0.4" y1="-0.25" x2="-0.5" y2="-0.25" width="0.1" layer="51"/>
<wire x1="-0.5" y1="-0.25" x2="-0.5" y2="0.25" width="0.1" layer="51"/>
<wire x1="-0.4" y1="0.25" x2="-0.4" y2="-0.25" width="0.1" layer="51"/>
<wire x1="0.4" y1="0.25" x2="0.4" y2="-0.25" width="0.1" layer="51"/>
</package>
<package name="C0603">
<description>INCH=0603, METRIC=1608
From TDK Land Recommendation for Commercial Grade, up to 630 Volts.</description>
<smd name="1" x="-0.8" y="0" dx="0.8" dy="0.8" layer="1"/>
<smd name="2" x="0.8" y="0" dx="0.8" dy="0.8" layer="1"/>
<text x="-1.735" y="0.835" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.035" y="-1.605" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<wire x1="-0.5" y1="0.6" x2="-1.3" y2="0.6" width="0.16" layer="21"/>
<wire x1="-1.3" y1="0.6" x2="-1.3" y2="-0.6" width="0.16" layer="21"/>
<wire x1="-1.3" y1="-0.6" x2="-0.5" y2="-0.6" width="0.16" layer="21"/>
<wire x1="0.5" y1="0.6" x2="1.3" y2="0.6" width="0.16" layer="21"/>
<wire x1="1.3" y1="0.6" x2="1.3" y2="-0.6" width="0.16" layer="21"/>
<wire x1="1.3" y1="-0.6" x2="0.5" y2="-0.6" width="0.16" layer="21"/>
<wire x1="-0.8" y1="0.4" x2="-0.6" y2="0.4" width="0.1" layer="51"/>
<wire x1="-0.6" y1="0.4" x2="0.6" y2="0.4" width="0.1" layer="51"/>
<wire x1="0.6" y1="0.4" x2="0.8" y2="0.4" width="0.1" layer="51"/>
<wire x1="0.8" y1="0.4" x2="0.8" y2="-0.4" width="0.1" layer="51"/>
<wire x1="0.8" y1="-0.4" x2="0.6" y2="-0.4" width="0.1" layer="51"/>
<wire x1="0.6" y1="-0.4" x2="-0.6" y2="-0.4" width="0.1" layer="51"/>
<wire x1="-0.6" y1="-0.4" x2="-0.8" y2="-0.4" width="0.1" layer="51"/>
<wire x1="-0.8" y1="-0.4" x2="-0.8" y2="0.4" width="0.1" layer="51"/>
<wire x1="-0.6" y1="0.4" x2="-0.6" y2="-0.4" width="0.1" layer="51"/>
<wire x1="0.6" y1="0.4" x2="0.6" y2="-0.4" width="0.1" layer="51"/>
</package>
<package name="C0805">
<description>INCH=0805, METRIC=2012
From TDK Land Recommendation for Commercial Grade, up to 630 Volts.</description>
<smd name="1" x="-0.9" y="0" dx="0.9" dy="1.2" layer="1"/>
<smd name="2" x="0.9" y="0" dx="0.9" dy="1.2" layer="1"/>
<text x="-1.77" y="1.17" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.17" y="-1.84" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<rectangle x1="-0.2" y1="-0.6" x2="0.2" y2="0.6" layer="35"/>
<wire x1="-0.6" y1="0.8" x2="-1.5" y2="0.8" width="0.16" layer="21"/>
<wire x1="-1.5" y1="0.8" x2="-1.5" y2="-0.8" width="0.16" layer="21"/>
<wire x1="-1.5" y1="-0.8" x2="-0.6" y2="-0.8" width="0.16" layer="21"/>
<wire x1="0.6" y1="0.8" x2="1.5" y2="0.8" width="0.16" layer="21"/>
<wire x1="1.5" y1="0.8" x2="1.5" y2="-0.8" width="0.16" layer="21"/>
<wire x1="1.5" y1="-0.8" x2="0.5" y2="-0.8" width="0.16" layer="21"/>
<wire x1="-1" y1="0.62" x2="-0.8" y2="0.62" width="0.1" layer="51"/>
<wire x1="-0.8" y1="0.62" x2="0.8" y2="0.62" width="0.1" layer="51"/>
<wire x1="0.8" y1="0.62" x2="1" y2="0.62" width="0.1" layer="51"/>
<wire x1="1" y1="0.62" x2="1" y2="-0.62" width="0.1" layer="51"/>
<wire x1="1" y1="-0.62" x2="0.8" y2="-0.62" width="0.1" layer="51"/>
<wire x1="0.8" y1="-0.62" x2="-0.8" y2="-0.62" width="0.1" layer="51"/>
<wire x1="-0.8" y1="-0.62" x2="-1" y2="-0.62" width="0.1" layer="51"/>
<wire x1="-1" y1="-0.62" x2="-1" y2="0.62" width="0.1" layer="51"/>
<wire x1="-0.8" y1="0.62" x2="-0.8" y2="-0.62" width="0.1" layer="51"/>
<wire x1="0.8" y1="0.62" x2="0.8" y2="-0.62" width="0.1" layer="51"/>
</package>
<package name="C1206">
<description>INCH=1206, METRIC=3216
From TDK Land Recommendation for Commercial Grade, up to 630 Volts.</description>
<wire x1="-1.6" y1="0.8" x2="-1.4" y2="0.8" width="0.1" layer="51"/>
<wire x1="-1.4" y1="0.8" x2="1.4" y2="0.8" width="0.1" layer="51"/>
<wire x1="1.4" y1="0.8" x2="1.6" y2="0.8" width="0.1" layer="51"/>
<wire x1="1.6" y1="0.8" x2="1.6" y2="-0.8" width="0.1" layer="51"/>
<wire x1="1.6" y1="-0.8" x2="1.4" y2="-0.8" width="0.1" layer="51"/>
<wire x1="1.4" y1="-0.8" x2="-1.4" y2="-0.8" width="0.1" layer="51"/>
<wire x1="-1.4" y1="-0.8" x2="-1.6" y2="-0.8" width="0.1" layer="51"/>
<wire x1="-1.6" y1="-0.8" x2="-1.6" y2="0.8" width="0.1" layer="51"/>
<wire x1="-1.4" y1="0.8" x2="-1.4" y2="-0.8" width="0.1" layer="51"/>
<wire x1="1.4" y1="0.8" x2="1.4" y2="-0.8" width="0.1" layer="51"/>
<smd name="P$1" x="-1.7" y="0" dx="1.2" dy="1.6" layer="1"/>
<smd name="P$2" x="1.7" y="0" dx="1.2" dy="1.6" layer="1"/>
<wire x1="-1" y1="0.9" x2="-2.4" y2="0.9" width="0.1" layer="21"/>
<wire x1="-2.4" y1="0.9" x2="-2.4" y2="-0.9" width="0.1" layer="21"/>
<wire x1="-2.4" y1="-0.9" x2="-1" y2="-0.9" width="0.1" layer="21"/>
<wire x1="1" y1="0.9" x2="2.4" y2="0.9" width="0.1" layer="21"/>
<wire x1="2.4" y1="0.9" x2="2.4" y2="-0.9" width="0.1" layer="21"/>
<wire x1="2.4" y1="-0.9" x2="1" y2="-0.9" width="0.1" layer="21"/>
<text x="-1.7" y="1.1" size="0.8" layer="21" ratio="15">&gt;NAME</text>
<text x="-2" y="-1.9" size="0.8" layer="21" ratio="15">&gt;VALUE</text>
</package>
<package name="LED-TH-3MM">
<wire x1="-3.81" y1="1.27" x2="-2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.905" x2="-3.175" y2="0.635" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.54" width="0.1524" layer="21"/>
<pad name="ANODE" x="-1.27" y="0" drill="1" shape="square"/>
<pad name="CATHODE" x="1.27" y="0" drill="1"/>
<text x="-2.664" y="-3.899" size="1.143" layer="25" font="vector" ratio="12">&gt;Name</text>
</package>
<package name="LED-TH-5MM">
<wire x1="-5.05" y1="2.54" x2="-3.51" y2="2.54" width="0.4064" layer="21"/>
<wire x1="-4.28" y1="1.67" x2="-4.28" y2="3.31" width="0.4064" layer="21"/>
<circle x="0" y="0" radius="3.81" width="0.3048" layer="21"/>
<pad name="ANODE" x="-1.27" y="0" drill="1" shape="square"/>
<pad name="CATHODE" x="1.27" y="0" drill="1"/>
<text x="-1.875" y="-5.115" size="0.8" layer="25" font="vector" ratio="15">&gt;Name</text>
</package>
<package name="CHIPLED_1206">
<description>&lt;b&gt;CHIPLED&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LG_LY N971.pdf</description>
<wire x1="1.6" y1="0.4" x2="1.6" y2="-0.4" width="0.1016" layer="51" curve="172.619069"/>
<wire x1="-0.95" y1="0.8" x2="0.95" y2="0.8" width="0.1016" layer="51"/>
<wire x1="0.95" y1="-0.8" x2="-0.95" y2="-0.8" width="0.1016" layer="51"/>
<circle x="1.425" y="0.55" radius="0.1" width="0.1016" layer="51"/>
<smd name="CATHODE(-)" x="1.75" y="0" dx="1.5" dy="1.5" layer="1" rot="R270"/>
<smd name="ANODE(+)" x="-1.75" y="0" dx="1.5" dy="1.5" layer="1" rot="R270"/>
<text x="-1.57" y="1.37" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-1.77" y="-2.04" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<rectangle x1="1.3375" y1="0.5375" x2="1.8375" y2="0.6625" layer="51" rot="R270"/>
<rectangle x1="1.275" y1="0.575" x2="1.5" y2="0.9" layer="51" rot="R270"/>
<rectangle x1="1.275" y1="0.275" x2="1.4" y2="0.5" layer="51" rot="R270"/>
<rectangle x1="1.075" y1="0.375" x2="1.5" y2="0.5" layer="51" rot="R270"/>
<rectangle x1="1.225" y1="-0.775" x2="1.725" y2="-0.425" layer="51" rot="R270"/>
<rectangle x1="0.9875" y1="-0.6125" x2="1.5875" y2="-0.4875" layer="51" rot="R270"/>
<rectangle x1="0.25" y1="-0.15" x2="1.95" y2="0.15" layer="51" rot="R270"/>
<rectangle x1="-2.15" y1="-0.35" x2="-0.45" y2="0.35" layer="51" rot="R270"/>
<rectangle x1="0.4" y1="0.475" x2="0.725" y2="0.9" layer="21" rot="R270"/>
<rectangle x1="0.4" y1="-0.9" x2="0.725" y2="-0.475" layer="21" rot="R270"/>
<rectangle x1="0" y1="-0.175" x2="0.35" y2="0.175" layer="21" rot="R270"/>
<wire x1="-2.3" y1="1.7" x2="-2.3" y2="1.1" width="0.127" layer="21"/>
<wire x1="-2.6" y1="1.4" x2="-2" y2="1.4" width="0.127" layer="21"/>
</package>
<package name="LED-TH100">
<description>2 Pin TH, 4mm Dia Circle, with polatery marking</description>
<pad name="P$1" x="-1.27" y="0" drill="1" shape="square"/>
<pad name="P$2" x="1.27" y="0" drill="1"/>
<text x="-2.1" y="-3.3" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<text x="-1.8" y="2.5" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<circle x="0" y="0" radius="2.20226875" width="0.127" layer="21"/>
<wire x1="-2.7" y1="1.4" x2="-2.1" y2="1.4" width="0.127" layer="21"/>
<wire x1="-2.4" y1="1.7" x2="-2.4" y2="1.1" width="0.127" layer="21"/>
</package>
<package name="LED_0603">
<smd name="ANODE(+)" x="-0.825" y="0" dx="0.8" dy="0.8" layer="1"/>
<smd name="CATHODE(-)" x="0.825" y="0" dx="0.8" dy="0.8" layer="1"/>
<wire x1="-0.8" y1="0.4" x2="-0.5" y2="0.4" width="0.127" layer="51"/>
<wire x1="-0.5" y1="0.4" x2="0.5" y2="0.4" width="0.127" layer="51"/>
<wire x1="0.5" y1="0.4" x2="0.8" y2="0.4" width="0.127" layer="51"/>
<wire x1="0.8" y1="0.4" x2="0.8" y2="-0.4" width="0.127" layer="51"/>
<wire x1="0.8" y1="-0.4" x2="0.5" y2="-0.4" width="0.127" layer="51"/>
<wire x1="0.5" y1="-0.4" x2="-0.5" y2="-0.4" width="0.127" layer="51"/>
<wire x1="-0.5" y1="-0.4" x2="-0.8" y2="-0.4" width="0.127" layer="51"/>
<wire x1="-0.8" y1="-0.4" x2="-0.8" y2="0.4" width="0.127" layer="51"/>
<wire x1="-0.5" y1="0.4" x2="-0.5" y2="-0.4" width="0.127" layer="51"/>
<wire x1="0.5" y1="0.4" x2="0.5" y2="-0.4" width="0.127" layer="51"/>
<wire x1="-0.9" y1="0.8" x2="-0.5" y2="0.8" width="0.127" layer="21"/>
<wire x1="-0.7" y1="0.6" x2="-0.7" y2="1" width="0.127" layer="21"/>
<text x="-1.5" y="1.2" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-1.7" y="-1.5" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<wire x1="0.6" y1="0.6" x2="1.4" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.4" y1="0.6" x2="1.4" y2="-0.6" width="0.127" layer="21"/>
<wire x1="1.4" y1="-0.6" x2="0.6" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.2" y1="0.6" x2="-1.4" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.4" y1="0.6" x2="-1.4" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.4" y1="-0.6" x2="-0.6" y2="-0.6" width="0.127" layer="21"/>
</package>
<package name="LED_1206">
<description>INCH=1206, METRIC=3216.  Reflow.
Taken from Vishay layout for reflow soldering. 
Documnet RGF e3, Thick Film, Rectangular Chip Resistors.</description>
<smd name="ANODE(+)" x="-1.45" y="0" dx="0.9" dy="1.7" layer="1"/>
<smd name="CATHODE(-)" x="1.45" y="0" dx="0.9" dy="1.7" layer="1"/>
<wire x1="-1.735" y1="1.127" x2="-2.127" y2="1.127" width="0.1524" layer="21"/>
<wire x1="-2.127" y1="1.127" x2="-2.127" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="-2.127" y1="-1.127" x2="-1.1" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="1.1" y1="1.127" x2="2.127" y2="1.127" width="0.1524" layer="21"/>
<wire x1="2.127" y1="1.127" x2="2.127" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="2.127" y1="-1.127" x2="1.1" y2="-1.127" width="0.1524" layer="21"/>
<text x="-1.827" y="2.162" size="1.016" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2.1" y="-2.354" size="1.016" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<wire x1="-1.016" y1="1.778" x2="-1.016" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.524" x2="-0.762" y2="1.524" width="0.1524" layer="21"/>
</package>
<package name="R1X38">
<description>Large Device: 1" by 3/8"</description>
<wire x1="1.27" y1="5.08" x2="1.27" y2="-5.08" width="0.254" layer="21"/>
<wire x1="1.27" y1="-5.08" x2="24.13" y2="-5.08" width="0.254" layer="21"/>
<wire x1="24.13" y1="-5.08" x2="24.13" y2="5.08" width="0.254" layer="21"/>
<wire x1="24.13" y1="5.08" x2="1.27" y2="5.08" width="0.254" layer="21"/>
<pad name="1" x="0" y="0" drill="1.1"/>
<pad name="2" x="25.4" y="0" drill="1.1"/>
<text x="3.81" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="3.81" y="-3.81" size="1.27" layer="27" font="fixed" ratio="12">&gt;VALUE</text>
</package>
<package name="R300">
<wire x1="1.27" y1="0.635" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<pad name="P$1" x="0" y="0" drill="1"/>
<pad name="P$2" x="7.62" y="0" drill="1"/>
<text x="1.143" y="1.27" size="1.143" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="1.016" y="-2.413" size="1.143" layer="27" font="vector" ratio="12">&gt;Value</text>
</package>
<package name="D14MM">
<pad name="P$1" x="0" y="0" drill="1" shape="square"/>
<pad name="P$2" x="14" y="0" drill="1"/>
<wire x1="-2" y1="2" x2="-2" y2="-2" width="0.127" layer="21"/>
<wire x1="-2" y1="-2" x2="16" y2="-2" width="0.127" layer="21"/>
<wire x1="16" y1="-2" x2="16" y2="2" width="0.127" layer="21"/>
<wire x1="16" y1="2" x2="-2" y2="2" width="0.127" layer="21"/>
<text x="3" y="3" size="1.27" layer="25" ratio="12">&gt;NAME</text>
<text x="3" y="-4" size="1.27" layer="27" ratio="12">&gt;VALUE</text>
</package>
<package name="R0805">
<description>INCH=0805, METRIC=2012. Reflow.
Taken from Vishay layout for reflow soldering.
Documnet RGF e3, Thick Film, Rectangular Chip Resistors.</description>
<smd name="1" x="-1" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="1" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-1.8" y="1.283" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.1" y="-1.989" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<wire x1="-1.02" y1="0.62" x2="1" y2="0.62" width="0.127" layer="51"/>
<wire x1="1" y1="0.62" x2="1" y2="-0.62" width="0.127" layer="51"/>
<wire x1="1" y1="-0.62" x2="-1.02" y2="-0.62" width="0.127" layer="51"/>
<wire x1="-1.02" y1="-0.62" x2="-1.02" y2="0.62" width="0.127" layer="51"/>
<wire x1="-0.5" y1="0.9" x2="-1.8" y2="0.9" width="0.16" layer="21"/>
<wire x1="-1.8" y1="0.9" x2="-1.8" y2="-0.9" width="0.16" layer="21"/>
<wire x1="-1.8" y1="-0.9" x2="-0.5" y2="-0.9" width="0.16" layer="21"/>
<wire x1="0.5" y1="0.9" x2="1.8" y2="0.9" width="0.16" layer="21"/>
<wire x1="1.8" y1="0.9" x2="1.8" y2="-0.9" width="0.16" layer="21"/>
<wire x1="1.8" y1="-0.9" x2="0.5" y2="-0.9" width="0.16" layer="21"/>
</package>
<package name="R0603">
<description>INCH = 0603, METRIC=1608.  Reflow.
Taken from Vishay layout for reflow soldering.
Documnet RGF e3, Thick Film, Rectangular Chip Resistors.</description>
<smd name="P$1" x="-0.75" y="0" dx="0.5" dy="0.9" layer="1"/>
<smd name="P$2" x="0.75" y="0" dx="0.5" dy="0.9" layer="1"/>
<wire x1="-0.77" y1="0.42" x2="0.77" y2="0.42" width="0.05" layer="51"/>
<wire x1="0.77" y1="0.42" x2="0.77" y2="-0.42" width="0.05" layer="51"/>
<wire x1="0.77" y1="-0.42" x2="-0.77" y2="-0.42" width="0.05" layer="51"/>
<wire x1="-0.77" y1="-0.42" x2="-0.77" y2="0.42" width="0.05" layer="51"/>
<text x="-1.8" y="0.9" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2" y="-1.8" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<wire x1="-0.6" y1="0.6" x2="-1.2" y2="0.6" width="0.16" layer="21"/>
<wire x1="-1.2" y1="0.6" x2="-1.2" y2="-0.6" width="0.16" layer="21"/>
<wire x1="-1.2" y1="-0.6" x2="-0.6" y2="-0.6" width="0.16" layer="21"/>
<wire x1="0.6" y1="0.6" x2="1.2" y2="0.6" width="0.16" layer="21"/>
<wire x1="1.2" y1="0.6" x2="1.2" y2="-0.6" width="0.16" layer="21"/>
<wire x1="1.2" y1="-0.6" x2="0.6" y2="-0.6" width="0.16" layer="21"/>
</package>
<package name="R1206">
<description>INCH=1206, METRIC=3216.  Reflow.
Taken from Vishay layout for reflow soldering. 
Documnet RGF e3, Thick Film, Rectangular Chip Resistors.</description>
<smd name="P$1" x="-1.45" y="0" dx="0.9" dy="1.7" layer="1"/>
<smd name="P$2" x="1.45" y="0" dx="0.9" dy="1.7" layer="1"/>
<wire x1="-1.6" y1="0.8" x2="1.6" y2="0.8" width="0.1524" layer="51"/>
<wire x1="1.6" y1="0.8" x2="1.6" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="1.6" y1="-0.8" x2="-1.6" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-1.6" y1="-0.8" x2="-1.6" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-1.1" y1="1.127" x2="-2.127" y2="1.127" width="0.1524" layer="21"/>
<wire x1="-2.127" y1="1.127" x2="-2.127" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="-2.127" y1="-1.127" x2="-1.1" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="1.1" y1="1.127" x2="2.127" y2="1.127" width="0.1524" layer="21"/>
<wire x1="2.127" y1="1.127" x2="2.127" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="2.127" y1="-1.127" x2="1.1" y2="-1.127" width="0.1524" layer="21"/>
<text x="-1.7" y="1.4" size="1.016" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2.1" y="-2.354" size="1.016" layer="27" font="vector" ratio="12">&gt;VALUE</text>
</package>
<package name="TERMBLOCK_TH_200_1X5">
<pad name="P$1" x="0" y="0" drill="1.6"/>
<pad name="P$2" x="5.08" y="0" drill="1.6"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="22.86" y2="5.08" width="0.1524" layer="21"/>
<wire x1="22.86" y1="5.08" x2="22.86" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="22.86" y1="-5.08" x2="-2.54" y2="-5.08" width="0.1524" layer="21"/>
<text x="-1.27" y="6.35" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-7.62" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-1.27" y="-2.54" size="1.27" layer="21">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.6"/>
<pad name="P$4" x="15.24" y="0" drill="1.6"/>
<pad name="P$5" x="20.32" y="0" drill="1.6"/>
</package>
<package name="PINHDR_TH_100_1X5">
<pad name="1" x="-2.54" y="0" drill="1"/>
<pad name="2" x="0" y="0" drill="1"/>
<pad name="3" x="2.54" y="0" drill="1"/>
<text x="-2.43" y="-2.675" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="-4.44" y="-1.77" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<wire x1="-4.054" y1="1.524" x2="9.154" y2="1.524" width="0.16" layer="21"/>
<wire x1="9.154" y1="1.524" x2="9.154" y2="-1.524" width="0.16" layer="21"/>
<wire x1="9.154" y1="-1.524" x2="-4.054" y2="-1.524" width="0.16" layer="21"/>
<wire x1="-4.054" y1="-1.524" x2="-4.054" y2="1.524" width="0.16" layer="21"/>
<text x="10.28" y="-2.33" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
<pad name="4" x="5.08" y="0" drill="1"/>
<pad name="5" x="7.62" y="0" drill="1"/>
</package>
<package name="PH2_TH_SIDE_200_1X5">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.4"/>
<pad name="P$2" x="5.08" y="0" drill="1.4"/>
<wire x1="-3.175" y1="-2.794" x2="-3.175" y2="7.874" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="7.874" x2="23.495" y2="7.874" width="0.1524" layer="21"/>
<wire x1="23.495" y1="7.874" x2="23.495" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="23.495" y1="-2.794" x2="-3.175" y2="-2.794" width="0.1524" layer="21"/>
<text x="-3.81" y="8.89" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-3.81" y="-5.08" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="PA$1" x="0" y="5.08" drill="1.4"/>
<pad name="PA$2" x="5.08" y="5.08" drill="1.4"/>
<wire x1="0" y1="5.08" x2="0" y2="0" width="0.3048" layer="1"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="0" width="0.3048" layer="1"/>
<pad name="P$3" x="10.16" y="0" drill="1.4"/>
<pad name="PA$3" x="10.16" y="5.08" drill="1.4"/>
<wire x1="10.16" y1="5.08" x2="10.16" y2="0" width="0.3048" layer="1"/>
<pad name="P$4" x="15.24" y="0" drill="1.4"/>
<pad name="PA$4" x="15.24" y="5.08" drill="1.4"/>
<wire x1="15.24" y1="5.08" x2="15.24" y2="0" width="0.3048" layer="1"/>
<pad name="P$5" x="20.32" y="0" drill="1.4"/>
<wire x1="20.32" y1="5.08" x2="20.32" y2="0" width="0.3048" layer="1"/>
<pad name="PA$5" x="20.32" y="5.08" drill="1.4"/>
</package>
<package name="PHOENIX_TH_SIDE_200_1X5">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.5"/>
<pad name="P$2" x="5.08" y="0" drill="1.5"/>
<wire x1="-3.048" y1="-9.779" x2="-3.048" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="2.032" x2="23.622" y2="2.032" width="0.1524" layer="21"/>
<wire x1="23.622" y1="2.032" x2="23.622" y2="-9.779" width="0.1524" layer="21"/>
<wire x1="23.622" y1="-9.779" x2="-3.048" y2="-9.779" width="0.1524" layer="21"/>
<text x="-1.27" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-3.81" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.5"/>
<pad name="P$4" x="15.24" y="0" drill="1.5"/>
<pad name="P$5" x="20.32" y="0" drill="1.5"/>
</package>
<package name="JST-XH_098_VERT_1X5">
<description>JST Connector, XH Series, 0.098 Inch, 1x6</description>
<pad name="5" x="-10" y="0" drill="1"/>
<pad name="4" x="-7.5" y="0" drill="1"/>
<pad name="3" x="-5" y="0" drill="1"/>
<text x="0.9938" y="-2.4574" size="1.27" layer="51" font="vector" ratio="12">1</text>
<text x="-11.838" y="-5.334" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<pad name="2" x="-2.5" y="0" drill="1" rot="R90"/>
<pad name="1" x="0" y="0" drill="1" shape="square" rot="R90"/>
<wire x1="2.45" y1="2.5" x2="2.45" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="2.45" y1="-3.5" x2="-12.41" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="-12.41" y1="-3.5" x2="-12.41" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-12.41" y1="2.5" x2="-10.96" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-8.95" y1="2.5" x2="-1.02" y2="2.49" width="0.1524" layer="21"/>
<wire x1="2.45" y1="2.5" x2="1" y2="2.5" width="0.1524" layer="21"/>
<text x="-4.747" y="-5.308" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="RASPBERRY-PICO">
<description>Arduino-Nano</description>
<wire x1="10.16" y1="20.32" x2="10.16" y2="-33.02" width="0.254" layer="94"/>
<wire x1="10.16" y1="-33.02" x2="-12.7" y2="-33.02" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-33.02" x2="-12.7" y2="20.32" width="0.254" layer="94"/>
<wire x1="-12.7" y1="20.32" x2="-5.08" y2="20.32" width="0.254" layer="94"/>
<text x="-5.08" y="21.844" size="1.778" layer="95">&gt;NAME</text>
<text x="-8.382" y="-41.148" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="5.08" size="2.54" layer="94" rot="R270">Raspberrt Pi PICO</text>
<wire x1="-5.08" y1="20.32" x2="2.54" y2="20.32" width="0.254" layer="94"/>
<wire x1="2.54" y1="20.32" x2="10.16" y2="20.32" width="0.254" layer="94"/>
<wire x1="-5.08" y1="20.32" x2="-5.08" y2="15.24" width="0.254" layer="94"/>
<wire x1="-5.08" y1="15.24" x2="2.54" y2="15.24" width="0.254" layer="94"/>
<wire x1="2.54" y1="15.24" x2="2.54" y2="20.32" width="0.254" layer="94"/>
<pin name="GP0" x="-15.24" y="17.78" visible="off" length="short"/>
<pin name="GP1" x="-15.24" y="15.24" visible="off" length="short"/>
<pin name="GND1" x="-15.24" y="12.7" visible="off" length="short" direction="in"/>
<pin name="GP2" x="-15.24" y="10.16" visible="off" length="short"/>
<pin name="GP3" x="-15.24" y="7.62" visible="off" length="short"/>
<pin name="GP4" x="-15.24" y="5.08" visible="off" length="short"/>
<pin name="GP5" x="-15.24" y="2.54" visible="off" length="short"/>
<pin name="GND2" x="-15.24" y="0" visible="off" length="short" direction="in"/>
<pin name="GP6" x="-15.24" y="-2.54" visible="off" length="short"/>
<pin name="GP7" x="-15.24" y="-5.08" visible="off" length="short"/>
<pin name="GP8" x="-15.24" y="-7.62" visible="off" length="short"/>
<pin name="GP9" x="-15.24" y="-10.16" visible="off" length="short"/>
<pin name="GND3" x="-15.24" y="-12.7" visible="off" length="short" direction="in"/>
<pin name="GP10" x="-15.24" y="-15.24" visible="off" length="short"/>
<pin name="GP11" x="-15.24" y="-17.78" visible="off" length="short"/>
<pin name="GP12" x="-15.24" y="-20.32" visible="off" length="short"/>
<pin name="GP13" x="-15.24" y="-22.86" visible="off" length="short"/>
<pin name="GND4" x="-15.24" y="-25.4" visible="off" length="short" direction="in"/>
<pin name="GP14" x="-15.24" y="-27.94" visible="off" length="short"/>
<pin name="GP15" x="-15.24" y="-30.48" visible="off" length="short"/>
<pin name="GP16" x="12.7" y="-30.48" visible="off" length="short" rot="R180"/>
<pin name="GP17" x="12.7" y="-27.94" visible="off" length="short" rot="R180"/>
<pin name="GND5" x="12.7" y="-25.4" visible="off" length="short" direction="in" rot="R180"/>
<pin name="GP18" x="12.7" y="-22.86" visible="off" length="short" rot="R180"/>
<pin name="GP19" x="12.7" y="-20.32" visible="off" length="short" rot="R180"/>
<pin name="GP20" x="12.7" y="-17.78" visible="off" length="short" rot="R180"/>
<pin name="GP21" x="12.7" y="-15.24" visible="off" length="short" rot="R180"/>
<pin name="GND6" x="12.7" y="-12.7" visible="off" length="short" direction="in" rot="R180"/>
<pin name="GP22" x="12.7" y="-10.16" visible="off" length="short" rot="R180"/>
<pin name="RUN" x="12.7" y="-7.62" visible="off" length="short" rot="R180"/>
<pin name="GP26" x="12.7" y="-5.08" visible="off" length="short" rot="R180"/>
<pin name="GP27" x="12.7" y="-2.54" visible="off" length="short" rot="R180"/>
<pin name="GND7" x="12.7" y="0" visible="off" length="short" direction="in" rot="R180"/>
<pin name="GP28" x="12.7" y="2.54" visible="off" length="short" rot="R180"/>
<pin name="AREF" x="12.7" y="5.08" visible="off" length="short" rot="R180"/>
<pin name="3.3_OUT" x="12.7" y="7.62" visible="off" length="short" rot="R180"/>
<pin name="3.3_EN" x="12.7" y="10.16" visible="off" length="short" rot="R180"/>
<pin name="GND8" x="12.7" y="12.7" visible="off" length="short" direction="in" rot="R180"/>
<pin name="VSYS" x="12.7" y="15.24" visible="off" length="short" rot="R180"/>
<pin name="VBUS" x="12.7" y="17.78" visible="off" length="short" rot="R180"/>
<text x="-11.938" y="17.272" size="1.27" layer="94">GP0</text>
<text x="-11.938" y="14.732" size="1.27" layer="94">GP1</text>
<text x="-11.938" y="12.192" size="1.27" layer="94">GND</text>
<text x="-11.938" y="-25.908" size="1.27" layer="94">GND</text>
<text x="4.826" y="-25.908" size="1.27" layer="94">GND</text>
<text x="4.826" y="14.732" size="1.27" layer="94">VSYS</text>
<text x="-11.938" y="-0.508" size="1.27" layer="94">GND</text>
<text x="-11.938" y="-13.208" size="1.27" layer="94">GND</text>
<text x="4.826" y="-13.208" size="1.27" layer="94">GND</text>
<text x="-11.938" y="9.652" size="1.27" layer="94">GP2</text>
<text x="-11.938" y="7.112" size="1.27" layer="94">GP3</text>
<text x="-11.938" y="4.572" size="1.27" layer="94">GP4</text>
<text x="-11.938" y="2.032" size="1.27" layer="94">GP5</text>
<text x="-11.938" y="-3.048" size="1.27" layer="94">GP6</text>
<text x="-11.938" y="-5.588" size="1.27" layer="94">GP7</text>
<text x="-11.938" y="-8.128" size="1.27" layer="94">GP8</text>
<text x="-11.938" y="-10.668" size="1.27" layer="94">GP9</text>
<text x="-11.938" y="-15.748" size="1.27" layer="94">GP10</text>
<text x="-11.938" y="-18.288" size="1.27" layer="94">GP11</text>
<text x="-11.938" y="-20.828" size="1.27" layer="94">GP12</text>
<text x="-11.938" y="-23.368" size="1.27" layer="94">GP13</text>
<text x="-11.938" y="-28.448" size="1.27" layer="94">GP14</text>
<text x="-11.938" y="-30.988" size="1.27" layer="94">GP15</text>
<text x="4.826" y="-30.988" size="1.27" layer="94">GP16</text>
<text x="4.826" y="-28.448" size="1.27" layer="94">GP17</text>
<text x="4.826" y="-23.368" size="1.27" layer="94">GP18</text>
<text x="4.826" y="-20.828" size="1.27" layer="94">GP19</text>
<text x="4.826" y="-18.288" size="1.27" layer="94">GP20</text>
<text x="4.826" y="-15.748" size="1.27" layer="94">GP21</text>
<text x="4.826" y="-10.668" size="1.27" layer="94">GP22</text>
<text x="4.826" y="-8.128" size="1.27" layer="94">RUN</text>
<text x="4.826" y="-5.588" size="1.27" layer="94">GP26</text>
<text x="4.826" y="-3.048" size="1.27" layer="94">GP27</text>
<text x="4.826" y="-0.508" size="1.27" layer="94">GND</text>
<text x="4.826" y="2.032" size="1.27" layer="94">GP28</text>
<text x="4.826" y="4.572" size="1.27" layer="94">AREF</text>
<text x="1.778" y="7.112" size="1.27" layer="94">3V3_OUT</text>
<text x="3.048" y="9.652" size="1.27" layer="94">3V3_EN</text>
<text x="4.826" y="12.192" size="1.27" layer="94">GND</text>
<text x="4.826" y="17.272" size="1.27" layer="94">VBUS</text>
<pin name="SWCLK" x="-5.08" y="-35.56" visible="off" length="short" rot="R90"/>
<pin name="GND_DEBUG" x="-2.54" y="-35.56" visible="off" length="short" direction="in" rot="R90"/>
<pin name="SWDIO" x="0" y="-35.56" visible="off" length="short" rot="R90"/>
<text x="-4.572" y="-32.258" size="1.27" layer="94" rot="R90">SWCLK</text>
<text x="-2.032" y="-32.258" size="1.27" layer="94" rot="R90">GND</text>
<text x="0.508" y="-32.258" size="1.27" layer="94" rot="R90">SWDIO</text>
</symbol>
<symbol name="MAG_ENCODER_CON">
<pin name="P$1" x="-5.08" y="15.24" visible="off" length="short" direction="pas"/>
<pin name="P$2" x="-5.08" y="12.7" visible="off" length="short" direction="pas"/>
<pin name="P$3" x="-5.08" y="10.16" visible="off" length="short" direction="pas"/>
<pin name="P$4" x="-5.08" y="7.62" visible="off" length="short" direction="pas"/>
<pin name="P$5" x="-5.08" y="5.08" visible="off" length="short" direction="pas"/>
<pin name="P$6" x="-5.08" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="P$7" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="P$8" x="-5.08" y="-2.54" visible="off" length="short" direction="pas"/>
<pin name="P$9" x="-5.08" y="-5.08" visible="off" length="short" direction="pas"/>
<pin name="P$10" x="-5.08" y="-7.62" visible="off" length="short" direction="pas"/>
<text x="-1.016" y="14.732" size="1.4224" layer="94">3.3v (NC)</text>
<text x="-1.016" y="11.938" size="1.4224" layer="94">5V (in)</text>
<text x="-1.016" y="9.652" size="1.4224" layer="94">NC</text>
<text x="-1.016" y="7.112" size="1.4224" layer="94">FLMT</text>
<text x="-1.016" y="4.572" size="1.4224" layer="94">B</text>
<text x="-1.016" y="2.032" size="1.4224" layer="94">NC</text>
<text x="-1.016" y="-0.508" size="1.4224" layer="94">A</text>
<text x="-1.016" y="-3.048" size="1.4224" layer="94">RLMT</text>
<text x="-1.016" y="-5.588" size="1.4224" layer="94">PWM (out)</text>
<text x="-1.27" y="-8.382" size="1.4224" layer="94">GND</text>
<wire x1="-2.54" y1="17.78" x2="-2.54" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-10.16" x2="10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="10.16" y2="17.78" width="0.254" layer="94"/>
<wire x1="10.16" y1="17.78" x2="-2.54" y2="17.78" width="0.254" layer="94"/>
<text x="0" y="-12.7" size="1.778" layer="96">&gt;Value</text>
<text x="0.254" y="19.304" size="1.778" layer="95">&gt;Name</text>
</symbol>
<symbol name="PINHDR_1X3">
<wire x1="2.54" y1="0" x2="0.762" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0.762" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="0.762" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-3.175" y2="2.54" width="0.254" layer="94"/>
<wire x1="-3.175" y1="2.54" x2="-3.175" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-3.175" y1="-7.62" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="-5.08" radius="0.762" width="0.254" layer="94"/>
<text x="-4.064" y="3.048" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="5.08" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="3" x="5.08" y="-5.08" visible="off" length="short" direction="pas" rot="R180"/>
<text x="-2.54" y="-0.635" size="1.27" layer="94">1</text>
<text x="-2.54" y="-3.175" size="1.27" layer="94">2</text>
<text x="-2.54" y="-5.715" size="1.27" layer="94">3</text>
<text x="-4.572" y="-9.906" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="PINHDR_1X2">
<wire x1="2.54" y1="0" x2="0.762" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0.762" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-3.175" y2="2.54" width="0.254" layer="94"/>
<wire x1="-3.175" y1="2.54" x2="-3.175" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-3.175" y1="-5.08" x2="2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<circle x="0" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.762" width="0.254" layer="94"/>
<text x="-4.572" y="3.048" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="5.08" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
<text x="-2.54" y="-0.635" size="1.27" layer="94">1</text>
<text x="-2.54" y="-3.175" size="1.27" layer="94">2</text>
<text x="-4.572" y="-7.366" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="V-REG">
<pin name="IN" x="-7.62" y="5.08" visible="off" length="short" direction="pas"/>
<pin name="GND" x="0" y="0" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="OUT" x="7.62" y="5.08" visible="off" length="short" direction="pas" rot="R180"/>
<wire x1="-5.08" y1="10.16" x2="-5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="2.54" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="10.16" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<text x="-2.032" y="8.382" size="1.27" layer="94">VReg</text>
<text x="-4.318" y="5.08" size="1.27" layer="94">IN</text>
<text x="-1.778" y="3.048" size="1.27" layer="94">GND</text>
<text x="1.016" y="5.08" size="1.27" layer="94">OUT</text>
<text x="2.54" y="0" size="1.778" layer="96">&gt;Value</text>
<text x="-3.048" y="11.176" size="1.778" layer="95">&gt;Name</text>
</symbol>
<symbol name="CAP">
<wire x1="1.778" y1="1.27" x2="1.778" y2="0" width="0.254" layer="94"/>
<wire x1="1.778" y1="0" x2="1.778" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="0.127" y2="0" width="0.254" layer="94"/>
<wire x1="0.762" y1="0" x2="0.127" y2="0" width="0.254" layer="94"/>
<wire x1="1.778" y1="0" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="0.762" y1="0" x2="0.762" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0.762" y1="1.27" x2="0.762" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="2.032" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-3.556" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="+05V">
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0" y1="0.635" x2="0" y2="1.905" width="0.1524" layer="94"/>
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-1.905" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND-1">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.524" width="0.254" layer="94"/>
<wire x1="0" y1="-1.524" x2="-1.27" y2="0" width="0.254" layer="94"/>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="LED">
<wire x1="0" y1="1.524" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-1.524" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="2.54" y2="1.016" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.016" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="3.302" x2="1.524" y2="1.524" width="0.254" layer="94"/>
<wire x1="1.016" y1="3.81" x2="2.54" y2="2.032" width="0.254" layer="94"/>
<wire x1="1.016" y1="3.81" x2="1.27" y2="3.048" width="0.254" layer="94"/>
<wire x1="1.016" y1="3.81" x2="1.778" y2="3.302" width="0.254" layer="94"/>
<wire x1="0" y1="3.302" x2="0.254" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="3.302" x2="0.762" y2="2.794" width="0.254" layer="94"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="-2.794" width="0.254" layer="94"/>
<wire x1="3.556" y1="-2.032" x2="5.08" y2="-2.032" width="0.254" layer="94"/>
<text x="-2.54" y="4.318" size="1.778" layer="95">&gt;Name</text>
<pin name="CATHODE" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="ANODE" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<text x="-3.556" y="-4.826" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="R">
<wire x1="-5.08" y1="0" x2="-3.175" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="-3.175" y1="0" x2="-2.54" y2="1.016" width="0.254" layer="94"/>
<wire x1="-2.54" y1="1.016" x2="-1.905" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-0.762" x2="-1.27" y2="1.016" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.016" x2="-0.635" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-0.635" y1="-0.762" x2="0" y2="1.016" width="0.254" layer="94"/>
<wire x1="0" y1="1.016" x2="0.635" y2="-0.762" width="0.254" layer="94"/>
<wire x1="0.635" y1="-0.762" x2="1.27" y2="1.016" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.016" x2="1.905" y2="-0.762" width="0.254" layer="94"/>
<wire x1="1.905" y1="-0.762" x2="2.54" y2="0" width="0.254" layer="94"/>
<text x="-3.556" y="1.778" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.556" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="point" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="point" direction="pas" rot="R180"/>
</symbol>
<symbol name="PINHDR_1X5">
<wire x1="2.54" y1="0" x2="0.762" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0.762" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="0.762" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-3.175" y2="2.54" width="0.254" layer="94"/>
<wire x1="-3.175" y1="2.54" x2="-3.175" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-3.175" y1="-12.7" x2="2.54" y2="-12.7" width="0.254" layer="94"/>
<wire x1="2.54" y1="-12.7" x2="2.54" y2="-10.16" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="-5.08" radius="0.762" width="0.254" layer="94"/>
<text x="-4.064" y="3.048" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="5.08" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="3" x="5.08" y="-5.08" visible="off" length="short" direction="pas" rot="R180"/>
<text x="-2.54" y="-0.635" size="1.27" layer="94">1</text>
<text x="-2.54" y="-3.175" size="1.27" layer="94">2</text>
<text x="-2.54" y="-5.715" size="1.27" layer="94">3</text>
<text x="-4.572" y="-14.986" size="1.778" layer="96">&gt;VALUE</text>
<pin name="4" x="5.08" y="-7.62" visible="off" length="short" direction="pas" rot="R180"/>
<circle x="0" y="-7.62" radius="0.762" width="0.254" layer="94"/>
<wire x1="2.54" y1="-10.16" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="0.762" y2="-7.62" width="0.254" layer="94"/>
<text x="-2.54" y="-8.255" size="1.27" layer="94">4</text>
<text x="-2.54" y="-10.795" size="1.27" layer="94">5</text>
<pin name="5" x="5.08" y="-10.16" visible="off" length="short" direction="pas" rot="R180"/>
<circle x="0" y="-10.16" radius="0.762" width="0.254" layer="94"/>
<wire x1="2.54" y1="-10.16" x2="0.762" y2="-10.16" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RASPBERRY_PI_PICO">
<description>Raspberry PI PICO Board</description>
<gates>
<gate name="G$1" symbol="RASPBERRY-PICO" x="0" y="7.62"/>
</gates>
<devices>
<device name="HOLES" package="RASP_PI_PICO_HOLES">
<connects>
<connect gate="G$1" pin="3.3_EN" pad="3.3_EN"/>
<connect gate="G$1" pin="3.3_OUT" pad="3.3_OUT"/>
<connect gate="G$1" pin="AREF" pad="AREF"/>
<connect gate="G$1" pin="GND1" pad="GND1"/>
<connect gate="G$1" pin="GND2" pad="GND2"/>
<connect gate="G$1" pin="GND3" pad="GND3"/>
<connect gate="G$1" pin="GND4" pad="GND4"/>
<connect gate="G$1" pin="GND5" pad="GND5"/>
<connect gate="G$1" pin="GND6" pad="GND6"/>
<connect gate="G$1" pin="GND7" pad="GND7"/>
<connect gate="G$1" pin="GND8" pad="GND8"/>
<connect gate="G$1" pin="GND_DEBUG" pad="GND_DEG"/>
<connect gate="G$1" pin="GP0" pad="GP0"/>
<connect gate="G$1" pin="GP1" pad="GP1"/>
<connect gate="G$1" pin="GP10" pad="GP10"/>
<connect gate="G$1" pin="GP11" pad="GP11"/>
<connect gate="G$1" pin="GP12" pad="GP12"/>
<connect gate="G$1" pin="GP13" pad="GP13"/>
<connect gate="G$1" pin="GP14" pad="GP14"/>
<connect gate="G$1" pin="GP15" pad="GP15"/>
<connect gate="G$1" pin="GP16" pad="GP16"/>
<connect gate="G$1" pin="GP17" pad="GP17"/>
<connect gate="G$1" pin="GP18" pad="GP18"/>
<connect gate="G$1" pin="GP19" pad="GP19"/>
<connect gate="G$1" pin="GP2" pad="GP2"/>
<connect gate="G$1" pin="GP20" pad="GP20"/>
<connect gate="G$1" pin="GP21" pad="GP21"/>
<connect gate="G$1" pin="GP22" pad="GP22"/>
<connect gate="G$1" pin="GP26" pad="GP26"/>
<connect gate="G$1" pin="GP27" pad="GP27"/>
<connect gate="G$1" pin="GP28" pad="GP28"/>
<connect gate="G$1" pin="GP3" pad="GP3"/>
<connect gate="G$1" pin="GP4" pad="GP4"/>
<connect gate="G$1" pin="GP5" pad="GP5"/>
<connect gate="G$1" pin="GP6" pad="GP6"/>
<connect gate="G$1" pin="GP7" pad="GP7"/>
<connect gate="G$1" pin="GP8" pad="GP8"/>
<connect gate="G$1" pin="GP9" pad="GP9"/>
<connect gate="G$1" pin="RUN" pad="RUN"/>
<connect gate="G$1" pin="SWCLK" pad="SWCLK"/>
<connect gate="G$1" pin="SWDIO" pad="SWDIO"/>
<connect gate="G$1" pin="VBUS" pad="VBUS"/>
<connect gate="G$1" pin="VSYS" pad="VSYS"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD" package="RASP_PI_PICO_SMD">
<connects>
<connect gate="G$1" pin="3.3_EN" pad="P$37"/>
<connect gate="G$1" pin="3.3_OUT" pad="P$36"/>
<connect gate="G$1" pin="AREF" pad="P$35"/>
<connect gate="G$1" pin="GND1" pad="P$3"/>
<connect gate="G$1" pin="GND2" pad="P$8"/>
<connect gate="G$1" pin="GND3" pad="P$13"/>
<connect gate="G$1" pin="GND4" pad="P$18"/>
<connect gate="G$1" pin="GND5" pad="P$23"/>
<connect gate="G$1" pin="GND6" pad="P$28"/>
<connect gate="G$1" pin="GND7" pad="P$33"/>
<connect gate="G$1" pin="GND8" pad="P$38"/>
<connect gate="G$1" pin="GND_DEBUG" pad="P$42"/>
<connect gate="G$1" pin="GP0" pad="P$1"/>
<connect gate="G$1" pin="GP1" pad="P$2"/>
<connect gate="G$1" pin="GP10" pad="P$14"/>
<connect gate="G$1" pin="GP11" pad="P$15"/>
<connect gate="G$1" pin="GP12" pad="P$16"/>
<connect gate="G$1" pin="GP13" pad="P$17"/>
<connect gate="G$1" pin="GP14" pad="P$19"/>
<connect gate="G$1" pin="GP15" pad="P$20"/>
<connect gate="G$1" pin="GP16" pad="P$21"/>
<connect gate="G$1" pin="GP17" pad="P$22"/>
<connect gate="G$1" pin="GP18" pad="P$24"/>
<connect gate="G$1" pin="GP19" pad="P$25"/>
<connect gate="G$1" pin="GP2" pad="P$4"/>
<connect gate="G$1" pin="GP20" pad="P$26"/>
<connect gate="G$1" pin="GP21" pad="P$27"/>
<connect gate="G$1" pin="GP22" pad="P$29"/>
<connect gate="G$1" pin="GP26" pad="P$31"/>
<connect gate="G$1" pin="GP27" pad="P$32"/>
<connect gate="G$1" pin="GP28" pad="P$34"/>
<connect gate="G$1" pin="GP3" pad="P$5"/>
<connect gate="G$1" pin="GP4" pad="P$6"/>
<connect gate="G$1" pin="GP5" pad="P$7"/>
<connect gate="G$1" pin="GP6" pad="P$9"/>
<connect gate="G$1" pin="GP7" pad="P$10"/>
<connect gate="G$1" pin="GP8" pad="P$11"/>
<connect gate="G$1" pin="GP9" pad="P$12"/>
<connect gate="G$1" pin="RUN" pad="P$30"/>
<connect gate="G$1" pin="SWCLK" pad="P$41"/>
<connect gate="G$1" pin="SWDIO" pad="P$43"/>
<connect gate="G$1" pin="VBUS" pad="P$40"/>
<connect gate="G$1" pin="VSYS" pad="P$39"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MAG_ENCODER_CON" prefix="J">
<gates>
<gate name="G$1" symbol="MAG_ENCODER_CON" x="-2.54" y="-5.08"/>
</gates>
<devices>
<device name="" package="PINHDR_SMD_050_5X2">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$10" pad="10"/>
<connect gate="G$1" pin="P$2" pad="2"/>
<connect gate="G$1" pin="P$3" pad="3"/>
<connect gate="G$1" pin="P$4" pad="4"/>
<connect gate="G$1" pin="P$5" pad="5"/>
<connect gate="G$1" pin="P$6" pad="6"/>
<connect gate="G$1" pin="P$7" pad="7"/>
<connect gate="G$1" pin="P$8" pad="8"/>
<connect gate="G$1" pin="P$9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHDR_1X3" prefix="J">
<gates>
<gate name="G$1" symbol="PINHDR_1X3" x="0" y="0"/>
</gates>
<devices>
<device name="-098" package="PINHDR_TH_098_1X3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-100" package="PINHDR_TH_100_1X3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-156" package="PINHDR_TH_156_1X3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-JST" package="JST-XH_098_VERT_1X3">
<connects>
<connect gate="G$1" pin="1" pad="3"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="1"/>
</connects>
<technologies>
<technology name="XH"/>
</technologies>
</device>
<device name="-200" package="TERMBLOCK_TH_200_1X3">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH2" package="PH2_TH_SIDE_200_1X3">
<connects>
<connect gate="G$1" pin="1" pad="P$1 PA$1"/>
<connect gate="G$1" pin="2" pad="P$2 PA$2"/>
<connect gate="G$1" pin="3" pad="P$3 PA$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH1" package="PHOENIX_TH_SIDE_200_1X3">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHDR_1X2" prefix="J">
<gates>
<gate name="G$1" symbol="PINHDR_1X2" x="0" y="0"/>
</gates>
<devices>
<device name="-098" package="PINHDR_TH_098_1X2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-100" package="PINHDR_TH_100_1X2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-JST" package="JST-XH_098_VERT_1X2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-JST_HORZ" package="JST-XH_098_HORZ_1X2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-200" package="TERMBLOCK_TH_200_1X2">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH2" package="PH2_TH_SIDE_200_1X2">
<connects>
<connect gate="G$1" pin="1" pad="P$1 PA$1"/>
<connect gate="G$1" pin="2" pad="P$2 PA$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH1" package="PHOENIX_TH_SIDE_200_1X2">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VREG-3" prefix="U">
<description>3 Pin Voltage Regulator</description>
<gates>
<gate name="G$1" symbol="V-REG" x="-2.54" y="-10.16"/>
</gates>
<devices>
<device name="L7805CDT" package="TO252-3">
<connects>
<connect gate="G$1" pin="GND" pad="FIN"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-DIP" package="PINHDR_TH_100_1X3">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-HS" package="TO252-3-HS">
<connects>
<connect gate="G$1" pin="GND" pad="FIN"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CAP" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="CAP" x="-10.16" y="-5.08"/>
</gates>
<devices>
<device name="200" package="CAP200">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="300" package="CAP300">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0402" package="C0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805" package="C0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206" package="C1206">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+5V" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="+5V" symbol="+05V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="GND" symbol="GND-1" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LED" prefix="LED">
<description>Standard LED</description>
<gates>
<gate name="G$1" symbol="LED" x="-7.62" y="-5.08"/>
</gates>
<devices>
<device name="TH-3MM" package="LED-TH-3MM">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TH-5MM" package="LED-TH-5MM">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CHIP1206" package="CHIPLED_1206">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE(+)"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE(-)"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TH-DIP-100" package="LED-TH100">
<connects>
<connect gate="G$1" pin="ANODE" pad="P$1"/>
<connect gate="G$1" pin="CATHODE" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="LED_0603">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE(+)"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE(-)"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206" package="LED_1206">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE(+)"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE(-)"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="R" prefix="R" uservalue="yes">
<description>Standard Resistor -- Various Sizes and Wattages</description>
<gates>
<gate name="G$1" symbol="R" x="7.62" y="-2.54"/>
</gates>
<devices>
<device name="1X3/8INCH" package="R1X38">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="THOLE300" package="R300">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TH14MM" package="D14MM">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805(2012METRIC)" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603(1608METRIC)" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206(3216METRIC)" package="R1206">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHDR_1X5" prefix="J">
<gates>
<gate name="G$1" symbol="PINHDR_1X5" x="0" y="0"/>
</gates>
<devices>
<device name="-200" package="TERMBLOCK_TH_200_1X5">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
<connect gate="G$1" pin="4" pad="P$4"/>
<connect gate="G$1" pin="5" pad="P$5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TH_VERT_100" package="PINHDR_TH_100_1X5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH2" package="PH2_TH_SIDE_200_1X5">
<connects>
<connect gate="G$1" pin="1" pad="P$1 PA$1"/>
<connect gate="G$1" pin="2" pad="P$2 PA$2"/>
<connect gate="G$1" pin="3" pad="P$3 PA$3"/>
<connect gate="G$1" pin="4" pad="P$4 PA$4"/>
<connect gate="G$1" pin="5" pad="P$5 PA$5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH1" package="PHOENIX_TH_SIDE_200_1X5">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
<connect gate="G$1" pin="4" pad="P$4"/>
<connect gate="G$1" pin="5" pad="P$5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-JST" package="JST-XH_098_VERT_1X5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U1" library="Dal_V2" deviceset="RASPBERRY_PI_PICO" device="SMD"/>
<part name="J4" library="Dal_V2" deviceset="MAG_ENCODER_CON" device=""/>
<part name="J5" library="Dal_V2" deviceset="MAG_ENCODER_CON" device=""/>
<part name="J6" library="Dal_V2" deviceset="MAG_ENCODER_CON" device=""/>
<part name="J7" library="Dal_V2" deviceset="MAG_ENCODER_CON" device=""/>
<part name="J2" library="Dal_V2" deviceset="PINHDR_1X3" device="-JST" technology="XH"/>
<part name="J1" library="Dal_V2" deviceset="PINHDR_1X2" device="-JST"/>
<part name="U2" library="Dal_V2" deviceset="VREG-3" device="L7805CDT"/>
<part name="C1" library="Dal_V2" deviceset="CAP" device="0805" value="1uf"/>
<part name="C2" library="Dal_V2" deviceset="CAP" device="0805" value="1uf"/>
<part name="SUPPLY1" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND1" library="Dal_V2" deviceset="GND" device=""/>
<part name="LED1" library="Dal_V2" deviceset="LED" device="1206"/>
<part name="SUPPLY2" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND3" library="Dal_V2" deviceset="GND" device=""/>
<part name="SUPPLY3" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND4" library="Dal_V2" deviceset="GND" device=""/>
<part name="SUPPLY4" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND5" library="Dal_V2" deviceset="GND" device=""/>
<part name="SUPPLY5" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND6" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND2" library="Dal_V2" deviceset="GND" device=""/>
<part name="SUPPLY6" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND7" library="Dal_V2" deviceset="GND" device=""/>
<part name="R1" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="330"/>
<part name="GND8" library="Dal_V2" deviceset="GND" device=""/>
<part name="J3" library="Dal_V2" deviceset="PINHDR_1X5" device="-JST"/>
<part name="GND9" library="Dal_V2" deviceset="GND" device=""/>
<part name="J8" library="Dal_V2" deviceset="PINHDR_1X3" device="-100"/>
<part name="GND10" library="Dal_V2" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="33.02" y="96.52" size="1.4224" layer="97">PWR</text>
<text x="25.4" y="78.74" size="1.4224" layer="97">UART</text>
<text x="25.4" y="55.88" size="1.4224" layer="97">SPI</text>
<text x="35.56" y="106.68" size="1.4224" layer="97">6-12V
200 mA</text>
<text x="25.4" y="25.4" size="1.4224" layer="97">PROG</text>
</plain>
<instances>
<instance part="U1" gate="G$1" x="83.82" y="58.42" smashed="yes">
<attribute name="NAME" x="78.74" y="80.264" size="1.778" layer="95"/>
</instance>
<instance part="J4" gate="G$1" x="147.32" y="86.36" smashed="yes">
<attribute name="NAME" x="147.574" y="105.664" size="1.778" layer="95"/>
</instance>
<instance part="J5" gate="G$1" x="147.32" y="40.64" smashed="yes">
<attribute name="NAME" x="147.574" y="59.944" size="1.778" layer="95"/>
</instance>
<instance part="J6" gate="G$1" x="185.42" y="86.36" smashed="yes">
<attribute name="NAME" x="185.674" y="105.664" size="1.778" layer="95"/>
</instance>
<instance part="J7" gate="G$1" x="185.42" y="40.64" smashed="yes">
<attribute name="NAME" x="185.674" y="59.944" size="1.778" layer="95"/>
</instance>
<instance part="J2" gate="G$1" x="27.94" y="88.9" smashed="yes">
<attribute name="NAME" x="23.876" y="91.948" size="1.778" layer="95"/>
</instance>
<instance part="J1" gate="G$1" x="27.94" y="101.6" smashed="yes">
<attribute name="NAME" x="26.67" y="105.664" size="1.778" layer="95"/>
</instance>
<instance part="U2" gate="G$1" x="81.28" y="96.52" smashed="yes">
<attribute name="VALUE" x="71.12" y="111.76" size="1.778" layer="96"/>
<attribute name="NAME" x="78.232" y="107.696" size="1.778" layer="95"/>
</instance>
<instance part="C1" gate="G$1" x="71.12" y="93.98" smashed="yes" rot="R90">
<attribute name="NAME" x="69.088" y="93.98" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="74.676" y="93.98" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C2" gate="G$1" x="93.98" y="93.98" smashed="yes" rot="R90">
<attribute name="NAME" x="91.948" y="93.98" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="97.536" y="93.98" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="SUPPLY1" gate="+5V" x="104.14" y="83.82" smashed="yes">
<attribute name="VALUE" x="102.235" y="86.995" size="1.778" layer="96"/>
</instance>
<instance part="GND1" gate="GND" x="101.6" y="7.62" smashed="yes"/>
<instance part="LED1" gate="G$1" x="119.38" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="123.698" y="85.598" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="SUPPLY2" gate="+5V" x="139.7" y="104.14" smashed="yes">
<attribute name="VALUE" x="137.795" y="107.315" size="1.778" layer="96"/>
</instance>
<instance part="GND3" gate="GND" x="139.7" y="73.66" smashed="yes"/>
<instance part="SUPPLY3" gate="+5V" x="139.7" y="58.42" smashed="yes">
<attribute name="VALUE" x="137.795" y="61.595" size="1.778" layer="96"/>
</instance>
<instance part="GND4" gate="GND" x="139.7" y="27.94" smashed="yes"/>
<instance part="SUPPLY4" gate="+5V" x="177.8" y="104.14" smashed="yes">
<attribute name="VALUE" x="175.895" y="107.315" size="1.778" layer="96"/>
</instance>
<instance part="GND5" gate="GND" x="177.8" y="73.66" smashed="yes"/>
<instance part="SUPPLY5" gate="+5V" x="177.8" y="58.42" smashed="yes">
<attribute name="VALUE" x="175.895" y="61.595" size="1.778" layer="96"/>
</instance>
<instance part="GND6" gate="GND" x="177.8" y="27.94" smashed="yes"/>
<instance part="GND2" gate="GND" x="96.52" y="88.9" smashed="yes"/>
<instance part="SUPPLY6" gate="+5V" x="99.06" y="106.68" smashed="yes">
<attribute name="VALUE" x="97.155" y="109.855" size="1.778" layer="96"/>
</instance>
<instance part="GND7" gate="GND" x="119.38" y="83.82" smashed="yes"/>
<instance part="R1" gate="G$1" x="111.76" y="101.6" smashed="yes">
<attribute name="NAME" x="110.236" y="103.632" size="1.778" layer="95"/>
<attribute name="VALUE" x="109.474" y="98.552" size="1.778" layer="96"/>
</instance>
<instance part="GND8" gate="GND" x="35.56" y="78.74" smashed="yes"/>
<instance part="J3" gate="G$1" x="27.94" y="71.12" smashed="yes">
<attribute name="NAME" x="23.876" y="74.168" size="1.778" layer="95"/>
</instance>
<instance part="GND9" gate="GND" x="35.56" y="55.88" smashed="yes"/>
<instance part="J8" gate="G$1" x="27.94" y="35.56" smashed="yes">
<attribute name="NAME" x="23.876" y="38.608" size="1.778" layer="95"/>
</instance>
<instance part="GND10" gate="GND" x="38.1" y="22.86" smashed="yes"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GND1"/>
<wire x1="68.58" y1="71.12" x2="63.5" y2="71.12" width="0.1524" layer="91"/>
<wire x1="63.5" y1="71.12" x2="63.5" y2="58.42" width="0.1524" layer="91"/>
<wire x1="63.5" y1="58.42" x2="63.5" y2="45.72" width="0.1524" layer="91"/>
<wire x1="63.5" y1="45.72" x2="63.5" y2="33.02" width="0.1524" layer="91"/>
<wire x1="63.5" y1="33.02" x2="63.5" y2="15.24" width="0.1524" layer="91"/>
<wire x1="63.5" y1="15.24" x2="81.28" y2="15.24" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="GND8"/>
<wire x1="81.28" y1="15.24" x2="101.6" y2="15.24" width="0.1524" layer="91"/>
<wire x1="96.52" y1="71.12" x2="101.6" y2="71.12" width="0.1524" layer="91"/>
<wire x1="101.6" y1="71.12" x2="101.6" y2="58.42" width="0.1524" layer="91"/>
<wire x1="101.6" y1="58.42" x2="101.6" y2="45.72" width="0.1524" layer="91"/>
<wire x1="101.6" y1="45.72" x2="101.6" y2="33.02" width="0.1524" layer="91"/>
<wire x1="101.6" y1="33.02" x2="101.6" y2="15.24" width="0.1524" layer="91"/>
<wire x1="101.6" y1="15.24" x2="101.6" y2="10.16" width="0.1524" layer="91"/>
<junction x="101.6" y="15.24"/>
<pinref part="GND1" gate="GND" pin="GND"/>
<pinref part="U1" gate="G$1" pin="GND2"/>
<wire x1="68.58" y1="58.42" x2="63.5" y2="58.42" width="0.1524" layer="91"/>
<junction x="63.5" y="58.42"/>
<pinref part="U1" gate="G$1" pin="GND3"/>
<wire x1="68.58" y1="45.72" x2="63.5" y2="45.72" width="0.1524" layer="91"/>
<junction x="63.5" y="45.72"/>
<pinref part="U1" gate="G$1" pin="GND4"/>
<wire x1="68.58" y1="33.02" x2="63.5" y2="33.02" width="0.1524" layer="91"/>
<junction x="63.5" y="33.02"/>
<pinref part="U1" gate="G$1" pin="GND5"/>
<wire x1="96.52" y1="33.02" x2="101.6" y2="33.02" width="0.1524" layer="91"/>
<junction x="101.6" y="33.02"/>
<pinref part="U1" gate="G$1" pin="GND6"/>
<wire x1="96.52" y1="45.72" x2="101.6" y2="45.72" width="0.1524" layer="91"/>
<junction x="101.6" y="45.72"/>
<pinref part="U1" gate="G$1" pin="GND7"/>
<wire x1="96.52" y1="58.42" x2="101.6" y2="58.42" width="0.1524" layer="91"/>
<junction x="101.6" y="58.42"/>
<pinref part="U1" gate="G$1" pin="GND_DEBUG"/>
<wire x1="81.28" y1="22.86" x2="81.28" y2="15.24" width="0.1524" layer="91"/>
<junction x="81.28" y="15.24"/>
</segment>
<segment>
<pinref part="J4" gate="G$1" pin="P$10"/>
<wire x1="142.24" y1="78.74" x2="139.7" y2="78.74" width="0.1524" layer="91"/>
<pinref part="GND3" gate="GND" pin="GND"/>
<wire x1="139.7" y1="78.74" x2="139.7" y2="76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND4" gate="GND" pin="GND"/>
<wire x1="139.7" y1="30.48" x2="139.7" y2="33.02" width="0.1524" layer="91"/>
<pinref part="J5" gate="G$1" pin="P$10"/>
<wire x1="139.7" y1="33.02" x2="142.24" y2="33.02" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="P$10"/>
<wire x1="180.34" y1="33.02" x2="177.8" y2="33.02" width="0.1524" layer="91"/>
<pinref part="GND6" gate="GND" pin="GND"/>
<wire x1="177.8" y1="33.02" x2="177.8" y2="30.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J6" gate="G$1" pin="P$10"/>
<wire x1="180.34" y1="78.74" x2="177.8" y2="78.74" width="0.1524" layer="91"/>
<pinref part="GND5" gate="GND" pin="GND"/>
<wire x1="177.8" y1="78.74" x2="177.8" y2="76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="1"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="71.12" y1="91.44" x2="81.28" y2="91.44" width="0.1524" layer="91"/>
<pinref part="GND2" gate="GND" pin="GND"/>
<wire x1="81.28" y1="91.44" x2="93.98" y2="91.44" width="0.1524" layer="91"/>
<wire x1="93.98" y1="91.44" x2="96.52" y2="91.44" width="0.1524" layer="91"/>
<junction x="93.98" y="91.44"/>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="81.28" y1="96.52" x2="81.28" y2="91.44" width="0.1524" layer="91"/>
<junction x="81.28" y="91.44"/>
<pinref part="J1" gate="G$1" pin="2"/>
<wire x1="33.02" y1="99.06" x2="63.5" y2="99.06" width="0.1524" layer="91"/>
<wire x1="63.5" y1="99.06" x2="63.5" y2="91.44" width="0.1524" layer="91"/>
<wire x1="63.5" y1="91.44" x2="71.12" y2="91.44" width="0.1524" layer="91"/>
<junction x="71.12" y="91.44"/>
</segment>
<segment>
<pinref part="J3" gate="G$1" pin="1"/>
<wire x1="33.02" y1="71.12" x2="35.56" y2="71.12" width="0.1524" layer="91"/>
<pinref part="GND9" gate="GND" pin="GND"/>
<wire x1="35.56" y1="71.12" x2="35.56" y2="58.42" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="3"/>
<wire x1="33.02" y1="83.82" x2="35.56" y2="83.82" width="0.1524" layer="91"/>
<pinref part="GND8" gate="GND" pin="GND"/>
<wire x1="35.56" y1="83.82" x2="35.56" y2="81.28" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="LED1" gate="G$1" pin="CATHODE"/>
<pinref part="GND7" gate="GND" pin="GND"/>
<wire x1="119.38" y1="88.9" x2="119.38" y2="86.36" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J8" gate="G$1" pin="2"/>
<wire x1="33.02" y1="33.02" x2="38.1" y2="33.02" width="0.1524" layer="91"/>
<wire x1="38.1" y1="33.02" x2="38.1" y2="25.4" width="0.1524" layer="91"/>
<pinref part="GND10" gate="GND" pin="GND"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="SUPPLY2" gate="+5V" pin="+5V"/>
<pinref part="J4" gate="G$1" pin="P$2"/>
<wire x1="142.24" y1="99.06" x2="139.7" y2="99.06" width="0.1524" layer="91"/>
<wire x1="139.7" y1="99.06" x2="139.7" y2="101.6" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SUPPLY3" gate="+5V" pin="+5V"/>
<wire x1="139.7" y1="55.88" x2="139.7" y2="53.34" width="0.1524" layer="91"/>
<pinref part="J5" gate="G$1" pin="P$2"/>
<wire x1="139.7" y1="53.34" x2="142.24" y2="53.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SUPPLY4" gate="+5V" pin="+5V"/>
<wire x1="177.8" y1="101.6" x2="177.8" y2="99.06" width="0.1524" layer="91"/>
<pinref part="J6" gate="G$1" pin="P$2"/>
<wire x1="177.8" y1="99.06" x2="180.34" y2="99.06" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SUPPLY5" gate="+5V" pin="+5V"/>
<wire x1="177.8" y1="55.88" x2="177.8" y2="53.34" width="0.1524" layer="91"/>
<pinref part="J7" gate="G$1" pin="P$2"/>
<wire x1="177.8" y1="53.34" x2="180.34" y2="53.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="VSYS"/>
<wire x1="96.52" y1="73.66" x2="104.14" y2="73.66" width="0.1524" layer="91"/>
<pinref part="SUPPLY1" gate="+5V" pin="+5V"/>
<wire x1="104.14" y1="73.66" x2="104.14" y2="81.28" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="OUT"/>
<wire x1="88.9" y1="101.6" x2="93.98" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="93.98" y1="101.6" x2="93.98" y2="99.06" width="0.1524" layer="91"/>
<wire x1="93.98" y1="101.6" x2="99.06" y2="101.6" width="0.1524" layer="91"/>
<junction x="93.98" y="101.6"/>
<pinref part="SUPPLY6" gate="+5V" pin="+5V"/>
<wire x1="99.06" y1="101.6" x2="99.06" y2="104.14" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="99.06" y1="101.6" x2="106.68" y2="101.6" width="0.1524" layer="91"/>
<junction x="99.06" y="101.6"/>
</segment>
</net>
<net name="PWM1" class="0">
<segment>
<pinref part="J4" gate="G$1" pin="P$9"/>
<wire x1="142.24" y1="81.28" x2="132.08" y2="81.28" width="0.1524" layer="91"/>
<label x="132.588" y="81.788" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP12"/>
<wire x1="68.58" y1="38.1" x2="55.88" y2="38.1" width="0.1524" layer="91"/>
<label x="56.134" y="38.608" size="1.4224" layer="95"/>
</segment>
</net>
<net name="A1" class="0">
<segment>
<pinref part="J4" gate="G$1" pin="P$7"/>
<wire x1="142.24" y1="86.36" x2="132.08" y2="86.36" width="0.1524" layer="91"/>
<label x="132.588" y="86.868" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP10"/>
<wire x1="68.58" y1="43.18" x2="55.88" y2="43.18" width="0.1524" layer="91"/>
<label x="56.388" y="43.688" size="1.4224" layer="95"/>
</segment>
</net>
<net name="B1" class="0">
<segment>
<pinref part="J4" gate="G$1" pin="P$5"/>
<wire x1="142.24" y1="91.44" x2="132.08" y2="91.44" width="0.1524" layer="91"/>
<label x="132.334" y="92.202" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP11"/>
<wire x1="68.58" y1="40.64" x2="55.88" y2="40.64" width="0.1524" layer="91"/>
<label x="56.388" y="41.148" size="1.4224" layer="95"/>
</segment>
</net>
<net name="PWM2" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="P$9"/>
<wire x1="142.24" y1="35.56" x2="132.08" y2="35.56" width="0.1524" layer="91"/>
<label x="132.588" y="36.068" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP15"/>
<wire x1="68.58" y1="27.94" x2="55.88" y2="27.94" width="0.1524" layer="91"/>
<label x="56.134" y="28.448" size="1.4224" layer="95"/>
</segment>
</net>
<net name="A2" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="P$7"/>
<wire x1="142.24" y1="40.64" x2="132.08" y2="40.64" width="0.1524" layer="91"/>
<label x="132.842" y="41.148" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP13"/>
<wire x1="68.58" y1="35.56" x2="55.88" y2="35.56" width="0.1524" layer="91"/>
<label x="56.134" y="36.068" size="1.4224" layer="95"/>
</segment>
</net>
<net name="B2" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="P$5"/>
<wire x1="142.24" y1="45.72" x2="132.08" y2="45.72" width="0.1524" layer="91"/>
<label x="132.588" y="46.228" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP14"/>
<wire x1="68.58" y1="30.48" x2="55.88" y2="30.48" width="0.1524" layer="91"/>
<label x="56.134" y="30.988" size="1.4224" layer="95"/>
</segment>
</net>
<net name="PWM3" class="0">
<segment>
<pinref part="J6" gate="G$1" pin="P$9"/>
<wire x1="180.34" y1="81.28" x2="170.18" y2="81.28" width="0.1524" layer="91"/>
<label x="170.688" y="81.788" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP18"/>
<wire x1="96.52" y1="35.56" x2="109.22" y2="35.56" width="0.1524" layer="91"/>
<label x="102.616" y="36.068" size="1.4224" layer="95"/>
</segment>
</net>
<net name="A3" class="0">
<segment>
<pinref part="J6" gate="G$1" pin="P$7"/>
<wire x1="180.34" y1="86.36" x2="170.18" y2="86.36" width="0.1524" layer="91"/>
<label x="170.942" y="86.868" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP16"/>
<wire x1="96.52" y1="27.94" x2="109.22" y2="27.94" width="0.1524" layer="91"/>
<label x="102.87" y="28.448" size="1.4224" layer="95"/>
</segment>
</net>
<net name="B3" class="0">
<segment>
<pinref part="J6" gate="G$1" pin="P$5"/>
<wire x1="180.34" y1="91.44" x2="170.18" y2="91.44" width="0.1524" layer="91"/>
<label x="170.942" y="91.948" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP17"/>
<wire x1="96.52" y1="30.48" x2="109.22" y2="30.48" width="0.1524" layer="91"/>
<label x="102.87" y="30.988" size="1.4224" layer="95"/>
</segment>
</net>
<net name="PWM4" class="0">
<segment>
<pinref part="J7" gate="G$1" pin="P$9"/>
<wire x1="180.34" y1="35.56" x2="170.18" y2="35.56" width="0.1524" layer="91"/>
<label x="170.942" y="36.068" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP21"/>
<wire x1="96.52" y1="43.18" x2="109.22" y2="43.18" width="0.1524" layer="91"/>
<label x="102.362" y="43.688" size="1.4224" layer="95"/>
</segment>
</net>
<net name="A4" class="0">
<segment>
<pinref part="J7" gate="G$1" pin="P$7"/>
<wire x1="180.34" y1="40.64" x2="170.18" y2="40.64" width="0.1524" layer="91"/>
<label x="170.942" y="41.148" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP19"/>
<wire x1="96.52" y1="38.1" x2="109.22" y2="38.1" width="0.1524" layer="91"/>
<label x="102.616" y="38.608" size="1.4224" layer="95"/>
</segment>
</net>
<net name="B4" class="0">
<segment>
<pinref part="J7" gate="G$1" pin="P$5"/>
<wire x1="180.34" y1="45.72" x2="170.18" y2="45.72" width="0.1524" layer="91"/>
<label x="170.688" y="46.228" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP20"/>
<wire x1="96.52" y1="40.64" x2="109.22" y2="40.64" width="0.1524" layer="91"/>
<label x="102.616" y="41.148" size="1.4224" layer="95"/>
</segment>
</net>
<net name="RLMT4" class="0">
<segment>
<pinref part="J7" gate="G$1" pin="P$8"/>
<wire x1="180.34" y1="38.1" x2="170.18" y2="38.1" width="0.1524" layer="91"/>
<label x="170.942" y="38.608" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP28"/>
<wire x1="96.52" y1="60.96" x2="111.76" y2="60.96" width="0.1524" layer="91"/>
<label x="103.124" y="61.468" size="1.4224" layer="95"/>
</segment>
</net>
<net name="FLMT4" class="0">
<segment>
<pinref part="J7" gate="G$1" pin="P$4"/>
<wire x1="180.34" y1="48.26" x2="170.18" y2="48.26" width="0.1524" layer="91"/>
<label x="170.688" y="49.022" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP27"/>
<wire x1="96.52" y1="55.88" x2="111.76" y2="55.88" width="0.1524" layer="91"/>
<label x="103.124" y="56.388" size="1.4224" layer="95"/>
</segment>
</net>
<net name="RLMT3" class="0">
<segment>
<pinref part="J6" gate="G$1" pin="P$8"/>
<wire x1="180.34" y1="83.82" x2="170.18" y2="83.82" width="0.1524" layer="91"/>
<label x="170.942" y="84.328" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP26"/>
<wire x1="96.52" y1="53.34" x2="111.76" y2="53.34" width="0.1524" layer="91"/>
<label x="103.124" y="53.848" size="1.4224" layer="95"/>
</segment>
</net>
<net name="FLMT3" class="0">
<segment>
<pinref part="J6" gate="G$1" pin="P$4"/>
<wire x1="180.34" y1="93.98" x2="170.18" y2="93.98" width="0.1524" layer="91"/>
<label x="170.942" y="94.488" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP22"/>
<wire x1="96.52" y1="48.26" x2="111.76" y2="48.26" width="0.1524" layer="91"/>
<label x="102.87" y="48.768" size="1.4224" layer="95"/>
</segment>
</net>
<net name="RLMT2" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="P$8"/>
<wire x1="142.24" y1="38.1" x2="132.08" y2="38.1" width="0.1524" layer="91"/>
<label x="132.588" y="38.608" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP9"/>
<wire x1="68.58" y1="48.26" x2="53.34" y2="48.26" width="0.1524" layer="91"/>
<label x="55.372" y="48.768" size="1.4224" layer="95"/>
</segment>
</net>
<net name="FLMT2" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="P$4"/>
<wire x1="142.24" y1="48.26" x2="132.08" y2="48.26" width="0.1524" layer="91"/>
<label x="132.842" y="48.768" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP8"/>
<wire x1="68.58" y1="50.8" x2="53.34" y2="50.8" width="0.1524" layer="91"/>
<label x="55.372" y="51.308" size="1.4224" layer="95"/>
</segment>
</net>
<net name="RLMT1" class="0">
<segment>
<pinref part="J4" gate="G$1" pin="P$8"/>
<wire x1="142.24" y1="83.82" x2="132.08" y2="83.82" width="0.1524" layer="91"/>
<label x="132.588" y="84.328" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP7"/>
<wire x1="68.58" y1="53.34" x2="53.34" y2="53.34" width="0.1524" layer="91"/>
<label x="55.372" y="53.848" size="1.4224" layer="95"/>
</segment>
</net>
<net name="FLMT1" class="0">
<segment>
<pinref part="J4" gate="G$1" pin="P$4"/>
<wire x1="142.24" y1="93.98" x2="132.08" y2="93.98" width="0.1524" layer="91"/>
<label x="132.334" y="94.488" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GP6"/>
<wire x1="68.58" y1="55.88" x2="53.34" y2="55.88" width="0.1524" layer="91"/>
<label x="55.372" y="56.388" size="1.4224" layer="95"/>
</segment>
</net>
<net name="VIN" class="0">
<segment>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="71.12" y1="99.06" x2="71.12" y2="101.6" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="IN"/>
<wire x1="71.12" y1="101.6" x2="73.66" y2="101.6" width="0.1524" layer="91"/>
<wire x1="71.12" y1="101.6" x2="33.02" y2="101.6" width="0.1524" layer="91"/>
<junction x="71.12" y="101.6"/>
<label x="37.084" y="102.108" size="1.4224" layer="95"/>
<pinref part="J1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="SPI_SCK" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GP2"/>
<wire x1="33.02" y1="68.58" x2="68.58" y2="68.58" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="2"/>
<label x="43.434" y="69.342" size="1.4224" layer="95"/>
</segment>
</net>
<net name="SPI_TX" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GP3"/>
<wire x1="68.58" y1="66.04" x2="33.02" y2="66.04" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="3"/>
<label x="43.434" y="66.802" size="1.4224" layer="95"/>
</segment>
</net>
<net name="SPI_RX" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GP4"/>
<wire x1="33.02" y1="63.5" x2="68.58" y2="63.5" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="4"/>
<label x="43.434" y="64.262" size="1.4224" layer="95"/>
</segment>
</net>
<net name="SPI_CS" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GP5"/>
<wire x1="68.58" y1="60.96" x2="33.02" y2="60.96" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="5"/>
<label x="43.434" y="61.722" size="1.4224" layer="95"/>
</segment>
</net>
<net name="UART_TX" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GP0"/>
<wire x1="68.58" y1="76.2" x2="45.72" y2="76.2" width="0.1524" layer="91"/>
<wire x1="45.72" y1="76.2" x2="45.72" y2="88.9" width="0.1524" layer="91"/>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="45.72" y1="88.9" x2="33.02" y2="88.9" width="0.1524" layer="91"/>
<label x="49.53" y="76.962" size="1.4224" layer="95"/>
</segment>
</net>
<net name="UART_RX" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="2"/>
<wire x1="33.02" y1="86.36" x2="43.18" y2="86.36" width="0.1524" layer="91"/>
<wire x1="43.18" y1="86.36" x2="43.18" y2="73.66" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="GP1"/>
<wire x1="43.18" y1="73.66" x2="68.58" y2="73.66" width="0.1524" layer="91"/>
<label x="49.53" y="74.422" size="1.4224" layer="95"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="116.84" y1="101.6" x2="119.38" y2="101.6" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="ANODE"/>
<wire x1="119.38" y1="101.6" x2="119.38" y2="96.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SWCLK" class="0">
<segment>
<pinref part="J8" gate="G$1" pin="1"/>
<wire x1="33.02" y1="35.56" x2="48.26" y2="35.56" width="0.1524" layer="91"/>
<wire x1="48.26" y1="35.56" x2="48.26" y2="20.32" width="0.1524" layer="91"/>
<wire x1="48.26" y1="20.32" x2="78.74" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="SWCLK"/>
<wire x1="78.74" y1="20.32" x2="78.74" y2="22.86" width="0.1524" layer="91"/>
<label x="51.816" y="20.828" size="1.4224" layer="95"/>
</segment>
</net>
<net name="SWDIO" class="0">
<segment>
<pinref part="J8" gate="G$1" pin="3"/>
<wire x1="33.02" y1="30.48" x2="45.72" y2="30.48" width="0.1524" layer="91"/>
<wire x1="45.72" y1="30.48" x2="45.72" y2="17.78" width="0.1524" layer="91"/>
<wire x1="45.72" y1="17.78" x2="83.82" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="SWDIO"/>
<wire x1="83.82" y1="17.78" x2="83.82" y2="22.86" width="0.1524" layer="91"/>
<label x="51.816" y="18.288" size="1.4224" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
