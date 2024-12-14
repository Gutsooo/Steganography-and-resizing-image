function [BW_Image] = Grayscale2BW(Grayscale_Image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I=im2double(Grayscale_Image);
BW = zeros(size(I));
BW(I>0.5)=1;
BW_Image = (BW)==1;
end