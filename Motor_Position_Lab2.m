%% Motor Position Question (4)
J = 3e-6; % Moment of inertia of the rotor [kg.m^2]
b = 3.5e-6; % Motor friction constant [N.s/m]
K = 0.025; % Electric force and motor torque constant [V/rad/sec]
R = 5; % Electric resistance [Ohm]
L = 3e-6; % Electric inductance [H]
V = 100; % Input voltage [V]

%% Step 1: 
% Write the State-Space from in MATLAB with the motor position, motor speed,
% and current as state variables using properties above. Let the rotational position
% be the output. Hint: Matrix A will be 3 by 3, Matrix B will be 3 by 1, Matrix C will
% be 1 by 3, and Matrix D will be 0.

A = [0, 1, 0; 
     0, -b/J, K/J;
     0, -K/L, -R/L];
B = [0;
     0;
     1/L];
C = [1 0 0];
D = 0;

sys = ss(A, B, C, D);

%% Step 2: 
% Generate the step response from 0 to 10 secs, with 0.05 sec step size. V is the
% input signal.

t = 0:0.05:10;          % Time [s]
u = V * ones(size(t));  % Step input

% Simulate system response
[y, t_out, x_out] = lsim(sys, u, t);

% Plot current (output)
figure;
plot(t_out, y, 'LineWidth', 1.5)
xlabel('Time [s]')
ylabel('Position [rad]')
title('Motor Position Step Response')
grid on