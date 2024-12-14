function [Output_Image] = My_Imresize_1 (Input_Image, Resizing_Factor)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

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
        Resized_Image(i,j,:)=Input_Image(round(yi(i,1)),round(xi(1,j)),:);
    end
end

% return resized image
Output_Image = uint8(Resized_Image);

end



%method 2: more lines of code but faster execution
% if Num_Dims == 3
%     for i=1:Orows
%         for j=1:Ocolumns
%              Resized_Image(i,j,:)=Input_Image(round(yi(i,1)),round(xi(1,j)),:);
%         end
%     end
% else
%     for i=1:Orows
%         for j=1:Ocolumns
%            Resized_Image(i,j)=Input_Image(round(yi(i,1)),round(xi(1,j)));
%         end
%     end
% end