% Mike Kabot, AERO560 Assn 4 - Bang Bang
clear; close all; clc

%% problem 2

% inertia
J = 100;

% switch
tau_switch = 1;

% schmitt trigger
tau_schmitt = 5;
delta_on = 0.2;
delta_off = 0.1;

% simulate
swich = sim("asn_4_bb_switch.slx", 150);
schmitt = sim("asn_4_bb_schmitt.slx", 500);

% plots
figure()
hold on, grid on
plot3(swich.theta, swich.theta_dot, swich.tout, 'b')
xlabel("\theta")
ylabel("d \theta")
title("switch phase plane")

figure()
hold on, grid on
plot3(schmitt.theta, schmitt.theta_dot, schmitt.tout, 'r')
xlabel("\theta")
ylabel("d \theta")
title("schmitt phase plane")

% schmitt trigger convergence time iterations

tau = linspace(1,10);
for k = 1:length(tau)
    tau_schmitt = tau(k);
    out_k = sim("asn_4_bb_schmitt.slx", 500);
    theta = out_k.theta;
    tout = out_k.tout;
    
    % compute convergence times
    indices = find(theta>0.2);
    t_conv_index = indices(end);
    t_c(k) = tout(t_conv_index);

end

% plot iterations
figure()
grid on
plot(tau, t_c)
xlabel("/tau")
ylabel("convergence time")
title("2% convergence time")

%% problem 3
eul_i = [42 -16 23];
q_i = eul2quat(deg2rad([42 -16 23]), 'ZYX');
C_i = eul2rotm(eul_i, 'ZYX');
w_i = [0;0;0];


% gain parameters
m = 750;
J = m/12*diag([2 2 2]);
zeta = 0.7;
w_n = 0.5;

% gains
K_p = 2*J*w_n^2;
K_d = J*2*zeta*w_n;

% torque arms
dx = 0.5; % m
dy = 0.5; % m
dz = 0.5; % m

% thruster map
H_M = [0 dz -dy 0 dz -dy 0 -dz dy 0 -dz dy;
       dz 0 -dx -dz 0 dx dz 0 -dx -dz 0 dx;
      -dy dx 0 dy -dx 0 dy -dx 0 -dy dx 0];

% thruster force
u_a = 50; % N 

acs = sim("asn_4_bb_acs.slx", 50);

% plotsdd

% w_b_ECI
figure()
hold on, grid on
plot(acs.w_b_ECI)
xlabel("time [s]")
ylabel("w [rad/s]")
title("absolute w")

% q_b_ECI
figure()
hold on, grid on
plot(acs.eps_b_ECI)
plot(acs.eta_b_ECI)
xlabel("time [s]")
legend("/epsilon_1", "/epsilon_2", "/epsilon_3", "/eta")
title("quaternion")

%%
% commanded torque, schmitty trigger, torques
figure()
hold on, grid on
plot(acs.T_sc, color=[0 0 1 0.8])
plot(acs.T_c, 'r', linewidth=2)
xlabel("time [s]")
plot(acs.schmitt_out, 'g')
xlabel("time [s]")
title("commanded torque, applied torque, schmitt output")
