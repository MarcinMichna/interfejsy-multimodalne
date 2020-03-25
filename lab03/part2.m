clc; clearvars; close all;
addpath('BazaObrazow');


%testowy = imread('testowy_0_0000.jpeg');
%faceDetector = vision.CascadeObjectDetector();
%bbox = step(faceDetector, testowy);
%Out = insertObjectAnnotation(testowy,'rectangle',bbox,'Twarz');
%figure, imshow(Out), title('Wykryta twarz');


counter = 0;
D = 'BazaObrazow';
S = dir(fullfile(D,'testowy*.jpeg'));
for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    testowy = imread(F);
    bbox = step(faceDetector, testowy);
    if sum(bbox) ~= 0
        counter = counter + 1;
    end
end

fprintf('Liczba wykrytych twarzy: %d / %d \n', counter, numel(S));

