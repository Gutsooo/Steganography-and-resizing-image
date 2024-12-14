function [Output_Image] = My_Imresize_3 (Input_Image, Resizing_Factor)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%sum of pixels can be more than 255;
Input_Image = uint16(Input_Image);

% calculating image diamonds
[Irows, Icolumns, Num_Dims] = size(Input_Image);
Orows = round(Irows*Resizing_Factor);
Ocolumns = round(Icolumns*Resizing_Factor);
Resized_Image = zeros(Orows,Ocolumns,Num_Dims);

% mapping output image to input image
x = [1:Icolumns];
y = [1:Irows];
xi = linspace(1, size(x,2), Ocolumns);
yi = linspace(1, size(y,2), Orows)';

% find nearest neighbor and initial the value to output pixel
% method 1: less line of code
for i=1:Orows
    for j=1:Ocolumns
        x1 = ceil(xi(1,j))-1;
        x2 = ceil(xi(1,j));
        y1 = ceil(yi(i,1))-1;
        y2 = ceil(yi(i,1));
        if i==1
            y1 = y2;
            y2 = 2;
        end
        if j==1
            x1 = x2;   
            x2 = 2;
        end
        dx = abs(x1 - xi(1,j));
        dy = abs(y1 - yi(i,1)); 
        d1 = sqrt(dx^2 + dy^2);
        d2 = sqrt((1-dx)^2 + dy^2);
        d3 = sqrt(dx^2 + (1-dy)^2);
        d4 = sqrt((1-dx)^2 + (1-dy)^2);
        dtotal = d1+d2+d3+d4;
        factor = 1/dtotal;
        d1 = d1*factor;
        d2 = d2*factor;
        d3 = d3*factor;
        d4 = d4*factor;
        dtotal = dtotal*factor;
        e = (dtotal-d1)*Input_Image(y1,x1,:)+(dtotal-d2)*Input_Image(y1,x2,:)+(dtotal-d3)*Input_Image(y2,x1,:)+(dtotal-d4)*Input_Image(y2,x2,:);
        Resized_Image(i,j,:) = e/3;
    end
end

% return resized image
Output_Image = uint8(Resized_Image);

end