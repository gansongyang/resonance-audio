%% ambix Test
clc,clear,close all


ORDER = 1;

% Sources position
PositionSources = [0, 0; 45, 35.26; 90, 0];
aziS  = PositionSources(:,1); aziS = deg2rad(aziS);
elevS = PositionSources(:,2); elevS= deg2rad(elevS);

% SPK position
speakerAz = [135 -135 135 -135 45 -45 45 -45].';
speakerEl = [35.26 35.26 -35.26 -35.26 35.26 35.26 -35.26 -35.26].';
PositionSPK = [speakerAz,speakerEl];




audio = [1;1;1];
% audiout = ambencode(audio, ORDER, aziS, elevS);

% audioIn = [1 0 0 1; 1 .7071 .7071 .7071; 1 1 0 0]
