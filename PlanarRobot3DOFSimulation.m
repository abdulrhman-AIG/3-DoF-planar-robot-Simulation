clear all;
clc;
close all;

L1=10; L2=10; L3=10;
L(1) = Link([0 0 L1 0]);
L(2) = Link([0 0 L2 0]);
L(3) = Link([0 0 L3 0]);
ThreeLink = SerialLink(L);
ThreeLink.name = 'Planar3R';
ThreeLink.base=[10 10 0];
t=(0:0.05:2)';
a = xlsread('GGGLetter.xlsx');



masd=mstraj(a,[1,2,0],[],a(1,:),0.05,0)
TRAJ1=ThreeLink.fkine(masd);
yyt=transl(masd);
q1=ThreeLink.ikine(transl(masd),[0 0 0],'mask',[1 1 0 0 0 1]);

scatter(a(:,1),a(:,2),'filled','bo');
ThreeLink.plot(q1,'loop','workspace',[-20 20 -20 20 -20 20])



