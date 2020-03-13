%% 
clc; clear all; close all;

%% Import the Image

Image = imread('Albert.png');
Image = imresize(Image, 0.5);
Image = rgb2gray(Image);
figure(1); 
imshow(Image);

%% Filter Designing

HPF = [-1,-1,-1;-1,8,-1;-1,-1,-1];
%This is a simple Laplacian Mask (Ref : Sridhar, Chapter : Image Enhancement)

LPF = [1,1,1;1,1,1;1,1,1] .* (1/9);
%This is a averaging filter mask (Ref : Sridhar, Chapter : Image Enhancement)

%% Applying the Filters

I_HPF = conv2(Image,HPF);
I_LPF = conv2(Image,LPF);
figure(2);
subplot(121); imshow(uint8(I_HPF));
subplot(122); imshow(uint8(I_LPF));