# ADCS---Bang-Bang-RCS-Thrusters

A simulation of spacecraft attitude control using 12 RCS thrusters placed on the vertices of a cuboid-shaped 
spacecraft. 

## Discrete Element Implementation: Switches and Schmitt Triggers

Before attitude control can be performed using bang-bang control, the discrete elements must be implemented in 
Simulink and their behavior confirmed using graphical methods (phase portraits).

To do this, a 1DOF "spacecraft" is considered, where only rotation about a single axis is considered, and the 
discrete elements use the full-state feedback (where the state is the displacement angle and body rate) to
apply control. The elements implemented in Simulink are shown below:

<img src="/figures/switch_slx.png">

<img src="/figures/schmitt_slx.png">

## Switch Results

The outputs in the phase space of the switch look like the following, using an initial state of [1.5 rad, 0 rad/s]':

<img src="/figures/switch_phase_portrait.png">


<img src="/figures/switch_dth_t.png">


<img src="/figures/switch_th_t.png">