function [ Texture_samples ] = TextureGenerator()


% This program generates a mosaic image made of 4X5 textures 
%selected randomly from 6 prototype textures
%
% Read the six prototype textures
%
MulIma=uint8(zeros(6,256,256));% 3 dimension array to save all six 
%initial images
MulIma(1,:,:)=imread('InitialSamples\1201rf.tif');
MulIma(2,:,:)=imread('InitialSamples\1202rf.tif');
MulIma(3,:,:)=imread('InitialSamples\1203rf.tif');
MulIma(4,:,:)=imread('InitialSamples\1204rf.tif');
MulIma(5,:,:)=imread('InitialSamples\1205rf.tif');
MulIma(6,:,:)=imread('InitialSamples\1206rf.tif');
%Initialaise random number generator of MATLAB
rand('state',sum(100*clock));%Iniatialize Random Numbers
RandTexture=ceil(rand(4,5)*6);%Generate an array 4X5 with random integers in th einterval [1,6]
%disp('The Constructed array of textures consists of:')
%disp(RandTexture);
GnrtTxtr=RandTexture';
% Save in GroundTrue.dat the 20 labels of the selected textures
vol=fopen('GroundTrue.dat','w');
fprintf(vol,'%d ',GnrtTxtr(:));fclose (vol);
%Generate Image-array of textures according  to the array of numbers
Texture_samples=uint8(zeros(256,320));
for i=1:4
    for j=1:5
        v1=ceil(rand(2,1)*192)+1;%Select randomly a part of 64X64 from 
        v2=ceil(rand(2,1)*192)+1;%256X356 initial texture
        % Use squeeze cmd for coping data from 3D to 2 or 1 D arrays
        Texture_samples(((64*(i-1))+1):((64*(i-1))+64),((64*(j-1))+1):((64*(j-1))+64))...
            =squeeze(MulIma(RandTexture(i,j),v1:v1+63,v2:v2+63));
    end
end
imwrite(Texture_samples,'sliced_image/Texture_samples.tif')%Save the constructed mosaic image


end

