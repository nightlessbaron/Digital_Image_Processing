%% 
clc; clear all; close all;

%% Import the Image

Image = imread('Albert.png');
Image = imresize(Image, 0.5);
Image = rgb2gray(Image);
figure(1); 
imshow(Image);

%% Edges using DWT2

[cA, cH, cV, cD] = dwt2(Image,'haar');

figure(2);
subplot(221); imshow(uint8(cA)); 
subplot(222); imshow(uint8(cH)); 
subplot(223); imshow(uint8(cV)); 
subplot(224); imshow(uint8(cD)); 

%% Edges using Canny

Edge_Canny = edge(Image,'canny');
figure(3);
imshow(Edge_Canny); 
title("Edges using Canny");

%% Edges using Sobel

Edge_Sobel = edge(Image,'sobel');
figure(4);
imshow(Edge_Sobel); 
title("Edges using Sobel");