clear all;
clc;
close all;

L1=10; L2=20; L3=8;
L(1) = Link([0 0 L1 0]);
L(2) = Link([0 0 L2 0]);
L(3) = Link([0 0 L3 0]);
ThreeLink = SerialLink(L);
ThreeLink.name = 'Planar3R';
ThreeLink.base=[0 -10 0];
%t=(0:0.05:2)';
a = xlsread('GHNEM.xlsx');
masd=mstraj(a,[4,4,0],[],a(1,:),0.1,0)
%TRAJ1=ThreeLink.fkine(masd);
q1=ThreeLink.ikine(transl(masd),[0 0 0],'mask',[1 1 0 0 0 1]);
plot3(a(:,1),a(:,2), a(:,3));
ThreeLink.plot(q1,'loop','workspace',[-10 20 -20 20 0 20]);



