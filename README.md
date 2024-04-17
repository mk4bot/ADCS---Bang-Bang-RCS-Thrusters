# ADCS---Bang-Bang-RCS-Thrusters

A simulation of spacecraft attitude control using 12 RCS thrusters placed on the vertices of a cuboid-shaped 
spacecraft. 

## Discrete Element Implementation: Switches and Schmitt Triggers

Before attitude control can be performed using bang-bang control, the discrete elements must be implemented in 
Simulink and their behavior confirmed using graphical methods (phase portraits).

To do this, a 1DOF "spacecraft" is considered, where only rotation about a single axis is considered, and the 
discrete elements use the full-state feedback (where the state is the displacement angle and body rate) to
apply control. The elements implemented in Simulink are shown below:

### Switch

<p align="center">
    <img src="/figures/switch_slx.png">
</p>

### Schmitt

<p align="center">
    <img src="/figures/schmitt_slx.png">
</p>

## Switch Results

The outputs in the phase space of the switch look like the following, using an initial state of [1.5 rad, 0 rad/s]':

<p align="center">
    <img src="/figures/switch_phase_portrait.png" style="height:50%">


<img src="/figures/switch_dth_t.png" style="height:50%">


<img src="/figures/switch_th_t.png" style="height:50%">
</p>

## Schmitt Trigger Results

The outputs in the phase space of the switch look like the following, using an initial state of [1.5 rad, 0 rad/s]':

<p align="center">
    <img src="/figures/schmitt_phase_portrait.png" style="height:50%">


<img src="/figures/schmitt_dth_t.png" style="height:50%">


<img src="/figures/schmitt_th_t.png" style="height:50%">
</p>

In th above, it can be seen that the Schmitt Trigger exhibits the expected behavior, reaching its convergence limit at the boundary box near equilibrium. Likewise, the switch exhibits the expected behavior of converging towards equilibrium, and if the simulation were run longer it would asymptotically approach equililbrium.