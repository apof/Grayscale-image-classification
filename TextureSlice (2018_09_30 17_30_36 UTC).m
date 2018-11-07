function [ temp ] = TextureSlice( Texture_samples )

temp=zeros(20,64,64,'uint8');
counter=1;
for i=1:4
    for j=1:5
        index1=0;
        for ii=((i-1)*64)+1:i*64
            index1=index1+1;
            index2=0;
            for jj=((j-1)*64)+1:j*64
                index2=index2+1;
                temp(counter,(index2),(index1))=Texture_samples((ii),(jj));
            end
        end
        counter=counter+1;
    end
end

%temp2=zeros(64,64);
for i=1:20
    im_name=strcat('sliced_image/image', num2str(i),'.tif');
    for k=1:64
        for l=1:64
            temp2(l,k)=temp(i,k,l);
        end
    end
    imwrite(temp2,im_name);
end

end

