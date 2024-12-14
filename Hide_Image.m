function [Stego_Image] = Image_Encoder(Cover_Image,Secret_Message)

Random_Pattern = (round(rand(size(Cover_Image)))==1);
Limit = size(Secret_Message,1)*size(Secret_Message,2)*size(Secret_Message,3)*8;
Counter = 1;
Binary_Secret_Message = de2bi(Secret_Message,8)==1;
Binary_Secret_Message = (reshape(Binary_Secret_Message.',1,[]))';
for i=1:size(Cover_Image,1)
    for j=1:size(Cover_Image,2)
        Random_Pattern(i,j) = Binary_Secret_Message(Counter);
        Counter = Counter + 1;
        if Counter > Limit
           break
        end
    end
    if Counter > Limit
           break
    end
end
Stego_Image = bitset(Cover_Image,1,Random_Pattern);

end