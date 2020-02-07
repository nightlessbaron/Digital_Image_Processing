clc;
clear all;
close all;

orginal_image = imread('aeroplane.jpg');
gray_image = rgb2gray(orginal_image);
[x1,y1]=size(gray_image);
array(:,1) = reshape(gray_image(:,:,1),[],1);
sort_array = sort(array);
unique_array = unique(array);
iteration = size(unique_array,1);
count = zeros(iteration,1);
a = 1;
z = size(sort_array,1);
for i = 1:z
    if(sort_array(i) <= unique_array(a))
       count(a) = count(a)+1; 
    else
         a = a + 1;
    end
end

cdf = cumsum(count);
cdfmin = cdf(1);
cdfmax = cdf(a);
hist2 = zeros(iteration,1);
img2 = [];

for i = 1:a
    hist(i) = round((cdf(i)-cdfmin)/(x1*y1-cdfmin)*255);
end

final_image = zeros(x1,y1);
b=1;

for i=1:x1*y1
  img2(i) = round((cdf(unique_array==array(i))-cdfmin)/(x1*y1-cdfmin)*255);
end

final_image=cast(reshape(img2,[x1,y1]),'uint8');
imshow(final_image)
figure(2)
imshow(gray_image)