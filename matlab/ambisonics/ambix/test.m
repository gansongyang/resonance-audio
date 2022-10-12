clc, clear, close all

ORDER = 3;

% 4-sample long input audio buffer.
audioIn = [0.1 0.2 0.3 0.4 0.5]';

% Desired source's horizontal angle.
phi = 45 * pi / 180;
% Desired source's vertical angle.
theta = 90 * pi/180;

% ambCoeff2D = ambencodecoeff(ORDER, phi);
% audioOut2d = audioIn(:, 1) * ambCoeff2D;

ambCoeff3D = ambencodecoeff(ORDER, phi, theta);
audioOut3d = audioIn(:, 1) * ambCoeff3D;