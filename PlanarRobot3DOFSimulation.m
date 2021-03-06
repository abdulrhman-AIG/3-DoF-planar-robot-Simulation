clear all;
clc;
close all;

L1=10; L2=20; L3=8; % define the length of the robot
L(1) = Link([0 0 L1 0]); %D-H parameter for link 1
L(2) = Link([0 0 L2 0]);%D-H parameter for link 1
L(3) = Link([0 0 L3 0]);%D-H parameter for link 1
ThreeLink = SerialLink(L);% construct the robot 
ThreeLink.name = 'Planar3R'; % give it a name
ThreeLink.base=[0 -10 0]; % define the base
a = xlsread('GHNEM1.xlsx'); % read the points from an excel file 
masd=mstraj(a,[6,6,0],[],a(1,:),0.1,0); % use the mstraj function to find the trajectory 
trsl=transl(masd); % find the x-y-z of the trajectory 
q1=ThreeLink.ikine(transl(masd),[0 0 0],'mask',[1 1 0 0 0 1]); % find the inverse kinematics 
scatter(a(:,1),a(:,2),'filled','bo');% plot the points from an excel file
ThreeLink.plot(q1,'loop','workspace',[-20 20 -20 20 0 20]); % plot the robot giving it the inverse kinematics 



