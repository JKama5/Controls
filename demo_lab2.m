% This script is written for the MATLAB
% demo of ES3011 Lab 2 on 29th Oct 2025
% T. Jones
% 29th Oct 2025
clear; clc;
%% set system properties
m=5; % mass [Kg]
k=1.0; % spring constant [N/m]
b=0.5; % damping constant [N*s/m]
F= 2; % input force [N]
%% create a time array
T=20; % simulation time [s]
dt=0.05; % time step [s]
t = 0:dt:T; % time array [t]
%% create state space equations
A=[0 1;
-k/m -b/m];
B=[0; 1/m];
C=[1 0];
D=0;
sys=ss(A,B,C,D);
%% set input array
u=F*ones(size(t));
%% run simulation
lsim(sys,u,t);
