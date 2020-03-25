close all; clc;
addpath('BazaObrazow');

load modele_part1.mat

%parametry
testowy = imread('testowy_0_0000.jpeg');
level = 0.0001;
se = strel('disk',10);
bwareaopen_lvl = 100;


figure, subplot(2,3,1), imshow(testowy);
%model = createSkinModel('model_skory.bmp');
szary = probabilityIM(testowy,model_test_0_0000);
subplot(2,3,2), imshow(szary,[]);
colormap(gray);

%e
binarny = im2bw(szary, level);
subplot(2,3,3), imshow(binarny);

%f

zamkniety = imclose(binarny, se);
subplot(2,3,4), imshow(zamkniety);

%g
label1 = bwlabel(zamkniety);
res = regionprops(label1);
[res.Area];
wyczyszczony = bwareaopen(zamkniety,bwareaopen_lvl);
subplot(2,3,5), imshow(wyczyszczony);

%h

[x1, x2, twarz] = szukaj_twarz(wyczyszczony);
subplot(2,3,6), imshow(twarz);
subplot(2,3,1)
pos=[x1(2) x1(1) x2(2)-x1(2) x2(1)-x1(1)];
hold on;rectangle('Position',pos,'EdgeColor','red'); hold off

