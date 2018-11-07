function [ Texture_glcms ] = CM( Texture_sliced )

temp=zeros(64,64,'uint8');
Texture_glcms=zeros(8,8,20,'uint8');
for i=1:20
    for k=1:64
        for l=1:64
            temp(l,k)=Texture_sliced(i,k,l);
        end
    end
    glcms=graycomatrix(temp,'offset',[0 1]);
    for kk=1:8
        for ll=1:8         
            Texture_glcms(kk,ll,i)=glcms(kk,ll);
        end
    end
end

end

