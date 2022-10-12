%% plotting test
% with diff rotation angle
clc,clear,close all
R = 2;
elevation = linspace(0,360,361);
azimuth = linspace(0,360,361);

%% XY plane, Yaw, 

% XY postion
XY_theta = 90;
XY_phi = 36;

% rotation 
XY_yaw = pi/2;
XY_roll = 0;
XY_pitch = 0;

%
XY_x = linspace(0,R*sind(XY_theta)*cosd(XY_phi),10);
XY_y = linspace(0,R*sind(XY_theta)*sind(XY_phi),10);
XY_z = linspace(0,R*cosd(XY_theta),10);

% 
dirs = [XY_x;XY_y;XY_z;ones(size(XY_x))];

TFmatrix = makehgtform('xrotate',XY_roll,'yrotate',XY_pitch,'zrotate',XY_yaw,'translate',[1 2 3]);


M = makehgtform('translate',[1 2 3]);

TransYaw = M*dirs;

% rotate the line on XY-plane to the new direction
Yaw_dirs = TFmatrix*dirs;
aa = makehgtform('xrotate',XY_roll,'yrotate',XY_pitch,'zrotate',XY_yaw);


a1 = aa*dirs;
a2 = M*a1;
a3 = M*aa*dirs;
figure()
% circle, theta = 90 
CircleX = R*sind(90)*cosd(azimuth);
CircleY = R*sind(90)*sind(azimuth);
CircleZ = R*cosd(90);

plot(CircleX,CircleY);

hold all
plot(0,0,'+k', 'LineWidth',2,'DisplayName', 'Origin');

plot(XY_x,XY_y,'k')

% Yaw

plot(Yaw_dirs(1,:),Yaw_dirs(2,:),'r')
plot(TransYaw(1,:),TransYaw(2,:),'g')
plot(a1(1,:),a1(2,:),':b')
plot(a2(1,:),a2(2,:),'b')
plot(a3(1,:),a3(2,:),'-.r')
axis equal

legend([{''},{''}, ...
    {['before at ',num2str( XY_phi), '{\circ}']}, ...
    {['after rotated ',num2str(rad2deg(XY_yaw)), '{\circ}']}], ...
    'FontSize',10,'location','best')
xlabel('X',FontSize=16)
ylabel('Y',FontSize=16)
title(['Yaw, Rotate the line with ',num2str(rad2deg(XY_yaw)),'{\circ}'], ...
    FontSize=16)

% %% YZ plane, Roll, 
% % YZ postion
% YZ_theta = 66;
% YZ_phi = 90;
% 
% % rotation 
% YZ_yaw = 0;
% YZ_roll = -pi/2;
% YZ_pitch = 0;
% 
% %
% YZ_x = linspace(0,R*sind(YZ_theta)*cosd(YZ_phi),10);
% YZ_y = linspace(0,R*sind(YZ_theta)*sind(YZ_phi),10);
% YZ_z = linspace(0,R*cosd(YZ_theta),10);
% 
% dirsYZ = [YZ_x;YZ_y;YZ_z;ones(size(XY_x))];
% 
% TFmatrixYZ = makehgtform('xrotate',YZ_roll,'yrotate',YZ_pitch,'zrotate',YZ_yaw,'translate',[1 2 3]);
% 
% % rotate the line on YZ-plane to the new direction
% Roll_dirs = TFmatrixYZ*dirsYZ;
% 
% figure()
% plot(CircleX,CircleY);
% hold all
% plot(0,0,'+k', 'LineWidth',2,'DisplayName', 'Origin');
% 
% plot(YZ_y,YZ_z,'k')
% % Roll
% plot(Roll_dirs(2,:),Roll_dirs(3,:),'--r')
% 
% 
% axis equal
% xlabel('Y',FontSize=16)
% ylabel('Z',FontSize=16)
% 
% legend([{''},{''}, ...
%     {['before at ',num2str( YZ_theta), '{\circ}']}, ...
%     {['after rotated ',num2str(rad2deg(YZ_roll)), '{\circ}']}], ...
%     'FontSize',10,'location','best')
% 
% title(['Roll, Rotate the line with ',num2str(rad2deg(YZ_roll)),'{\circ}'], ...
%     FontSize=16)
% 
% 
% %% XZ plane, pitch, 
% % XZ postion
% XZ_theta = -25;
% XZ_phi = 0;
% 
% % rotation 
% XZ_yaw = 0;
% XZ_roll = 0;
% XZ_pitch = -pi/2;
% 
% %
% XZ_x = linspace(0,R*sind(XZ_theta)*cosd(XZ_phi),10);
% XZ_y = linspace(0,R*sind(XZ_theta)*sind(XZ_phi),10);
% XZ_z = linspace(0,R*cosd(XZ_theta),10);
% 
% dirsXZ = [XZ_x;XZ_y;XZ_z;ones(size(XZ_x))];
% 
% TFmatrixXZ = makehgtform('xrotate',XZ_roll,'yrotate',XZ_pitch,'zrotate',XZ_yaw,'translate',[1 2 3]);
% 
% % rotate the line on YZ-plane to the new direction
% Pitch_dirs = TFmatrixXZ*dirsXZ;
% 
% figure()
% plot(CircleX,CircleY);
% hold all
% plot(0,0,'+k', 'LineWidth',2,'DisplayName', 'Origin');
% 
% plot(XZ_z,XZ_x,'k')
% % Roll
% plot(Pitch_dirs(3,:),Pitch_dirs(1,:),'--r')
% 
% 
% axis equal
% xlabel('Z',FontSize=16)
% ylabel('X',FontSize=16)
% 
% 
% legend([{''},{''}, ...
%     {['before at ',num2str( XZ_theta), '{\circ}']}, ...
%     {['after rotated ',num2str(rad2deg(XZ_pitch)), '{\circ}']}], ...
%     'FontSize',10,'location','best')
% 
% title(['Pitch, Rotate the line with ',num2str(rad2deg(XZ_pitch)),'{\circ}'], ...
%     FontSize=16)
