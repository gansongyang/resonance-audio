%% Coordinates transform with rotation 
%
% transform the old xyz to new XYZ at the new coordinates
% Dir:  Size [3 x K]
% yaw, roll, pitch: rotation angle, unit: rad
% ---------------------------------------------------------

function [DirNew] = TransformMatrix(yaw,roll,pitch,Dir)

% transfer the size of Dir to [3 x K]
if size(Dir,1) ~= 3
    Dir = transpose(Dir);
end

% rotation matrix around Z axis
R_yaw = [cos(yaw),-sin(yaw),0,0;...
        -sin(yaw),cos(yaw),0;...
        0,0,1];
% rotation matrix around X axis
R_roll = [1,0,0;...
        0,cos(roll),sin(roll);...
        0,-sin(roll),cos(roll)];
% rotation matrix around Y axis
R_pitch = [cos(pitch),0,-sin(pitch);...
        0,1,0;...
        sin(pitch),0,cos(pitch)];

% rotation processing
DirNew = R_yaw * R_roll * R_pitch * Dir; 
end 