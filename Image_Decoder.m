function [Secret_Message] = Image_Decoder(Stego_Image)

LSB = (bitget(Stego_Image,1)==1);
LSB = (reshape(LSB.',1,[]))';
Binary_Image_Data = [1:8];
Exteracted_Secret_Message = uint8(zeros(274,418,3));
Counter = 1;
n = 0;
for i=1:size(Exteracted_Secret_Message,2)
    for j=1:size(Exteracted_Secret_Message,1)
        Counter = 8*n+1;
        for k=1:3
            Bit_Counter = Counter;
            for z=1:8
                Binary_Image_Data(9-z) = LSB(Bit_Counter+(k-1)*916256);
                Bit_Counter = Bit_Counter + 1;
            end
            temp = num2str(Binary_Image_Data);
            Image_Data = bin2dec(temp);
            Exteracted_Secret_Message(j,i,k) = Image_Data;
        end
        n = n+1;
    end
end
Secret_Message = Exteracted_Secret_Message;
end