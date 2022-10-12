%% test the function of ynm

% using  SN3D


clearvars
close all
clc

% Azimuth and elvation angles used.
AZIMUTH = linspace(0, 2 * pi, 10);
ELEVATION = linspace(-pi / 2, pi / 2, 10);

% Tolerated error margin.
EPSILON = 1e-15;

for azi = AZIMUTH
    for ele = ELEVATION
        assert(abs(ynm(0, 0, azi, ele) - 1) < EPSILON);
        assert(abs(ynm(1, -1, azi, ele) - cos(ele) * sin(azi)) < EPSILON);
        assert(abs(ynm(1, 0, azi, ele) - sin(ele)) < EPSILON);
        assert(abs(ynm(1, 1, azi, ele) - cos(ele) * cos(azi)) < EPSILON);
        assert(abs(ynm(2, -2, azi, ele) - sqrt(3) / 2 * cos(ele) * cos(ele) * ...
            sin(2 * azi)) < EPSILON);
        assert(abs(ynm(2, -1, azi, ele) - sqrt(3) / 2 * sin(2 * ele) * sin(azi))...
            < EPSILON);
        assert(abs(ynm(2, 0, azi, ele) - 0.5 * (3 * sin(ele) * sin(ele) - 1)) ...
            < EPSILON);
        assert(abs(ynm(2, 1, azi, ele) - sqrt(3) / 2 * sin(2 * ele) * cos(azi)) ...
            < EPSILON);
        assert(abs(ynm(2, 2, azi, ele) - sqrt(3) / 2 * cos(ele) * cos(ele) * ...
            cos(2 * azi)) < EPSILON);
        assert(abs(ynm(3, -3, azi, ele) - sqrt(5 / 8) * (cos(ele)).^3 * ...
            sin(3 * azi)) < EPSILON);
        assert(abs(ynm(3, -2, azi, ele) - sqrt(15) / 2 * sin(ele) * cos(ele) * ...
            cos(ele) * sin(2 * azi)) < EPSILON);
        assert(abs(ynm(3, -1, azi, ele) - sqrt(3 / 8) * cos(ele) * (5 * sin(ele)...
            * sin(ele) - 1) * sin(azi)) < EPSILON);
        assert(abs(ynm(3, 0, azi, ele) - 0.5 * sin(ele) * (5 * sin(ele) * ...
            sin(ele) - 3)) < EPSILON);
        assert(abs(ynm(3, 1, azi, ele) - sqrt(3 / 8) * cos(ele) * (5 * sin(ele) ...
            * sin(ele) - 1) * cos(azi)) < EPSILON);
        assert(abs(ynm(3, 2, azi, ele) - sqrt(15) / 2 * sin(ele) * cos(ele) * ...
            cos(ele) * cos(2 * azi)) < EPSILON);
        assert(abs(ynm(3, 3, azi, ele) - sqrt(5 / 8) * (cos(ele)).^3 * ...
            cos(3 * azi)) < EPSILON);
    end
end
