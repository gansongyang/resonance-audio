%% SH rotation test
% with diff rotation angle
clc,clear,close all

order = 1;

speakerAzRad1 = [45 135 225 315 45 135 225 315] * pi / 180;
speakerElRad1 = [35.26 35.26  35.26  35.26 -35.26 -35.26 -35.26 -35.26] ...
    * pi / 180;

roll  = [22] * pi / 180;
pitch = [0 ] * pi / 180;
yaw   = [0] * pi / 180;


% Compute the 3D transform matrix.
transformMatrix = ...
    makehgtform('xrotate',roll,'yrotate',pitch,'zrotate',yaw);

% Convert SH sampling angles to Cartesian coordinates.
[x, y, z] = sph2cart(speakerAzRad1, speakerElRad1, 1);

% Rotate the SH sampling angles. We don't need the scale.
rotatedSamplingPoints = (transformMatrix(1:3, 1:3) * [x; y; z])';

% Convert SH sampling angles back to spherical.
[phiVectorRot, thetaVectorRot] = cart2sph(rotatedSamplingPoints(:,1), ...
    rotatedSamplingPoints(:,2), rotatedSamplingPoints(:,3));

% Compute the SH rotation matrix.
[decodingMatrix, ~] = ambdecodematrix(order, speakerAzRad1, speakerElRad1);
[~, reencodingMatrix, conditionNumber] = ambdecodematrix(order, ...
    phiVectorRot, thetaVectorRot);

% Check if the matrix is well-conditioned and display a warning, if not.
if conditionNumber > 1 / (max(size(reencodingMatrix)) * eps)
    disp('Warning: Re-encoding matrix is ill-conditioned. The resultant rotation matrix may not be accurate');
end
rotationMatrix = decodingMatrix * reencodingMatrix;


% Initial sound source azimuth and elevation angles.
sourceAzRad = 0;
sourceElRad = 0;


% Generate Ambix-encoded First Order Ambisonic signal.
ambix1 = ambencode(1, 1, sourceAzRad, sourceElRad);


ambix1Rotated = rotationMatrix*ambix1';