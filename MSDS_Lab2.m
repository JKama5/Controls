%% Spring-Mass-Damper-System Question 1
m = 5; % kg
k = 1.0; % N/m
b = 0.5; % N.s/m
F = 2; % N

%% Step 1: Draw the Free Body Diagram for this system.
%% Step 2: Use Newton%s 2nd Law to form the differential equation of this system. 
% Position 𝑥 is the dependent variable.

syms x_pos xx_vel

xxx_accel = (1/m)*(F-(k*x_pos)-(b*xx_vel));

%% Step 3: Create the State-Space model in MATLAB using the properties above. 
% Set position and velocity as state variables. Include the code and answer in your report.
% Hint: use the  ss’ command.

A = [0,1; -k/m, -b/m];
B = [0;1/m];
C = [1,0];
D = 0;

sys = ss(A,B,C,D);

%% Step 4: Generate the step response from 0 to 20 secs, with 0.05 sec step size.
% F is the input signal.

time = 0:0.05:20;
F_input = 2* ones(size(time));

% integrating state space over time with lsim
[y, t, x] = lsim(sys, F_input, time);

% plotting output position over time on a graph
figure;
plot(t, y, 'LineWidth', 1.5)
grid on
xlabel('Time (s)')
ylabel('Position (m)')
title('Step Response of Spring-Mass-Damper System (F = 2N')
