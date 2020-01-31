clc;
clear all;
close all;

orginal_image = imread('lena_std.tif');
red = orginal_image;
red(:,:,2) = 0;
red(:,:,3) = 0;
green = orginal_image;
green(:,:,1) = 0;
green(:,:,3) = 0;
blue = orginal_image;
blue(:,:,1) = 0;
blue(:,:,2) = 0;

imshow(orginal_image)
figure(1)
imshow(red)
figure(2)
imshow(green)
figure(3)
imshow(blue)