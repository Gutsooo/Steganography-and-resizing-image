function [BW_Image] = RGB2BW(RGB_Image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I=im2double(RGB_Image);
Z = zeros(size(I,1),size(I,2));
for i=1:size(I,1)
    for j=1:size(I,2)    
        if I(i,j,1)+I(i,j,2)+I(i,j,3)>1.5
        Z(i,j)=1;
        end
    end
end
BW_Image = (Z)==1;
end