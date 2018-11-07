LOOP=200;
res1=0;
res2=0;
for loop=1:LOOP
%This function stores the outcome of the right classification of 24 images
[Right_Classified,mean_element] = Trainer();

%Create a random Texture of size 256x320
Texture_sample = TextureGenerator();
%Texture_sample_double(:,:)=double(Texture_sample);

%Slice the Texture to 20 images of size 64x64
Texture_sliced = TextureSlice(Texture_sample);

%CM calculation
Texture_CM = CM(Texture_sliced);

stat=graycoprops(Texture_CM,{'contrast','homogeneity','energy'});
items_to_classify=zeros(20,3);
for i=1:20
    items_to_classify(i,1)=stat.Contrast(i)/10;
    items_to_classify(i,2)=stat.Homogeneity(i);
    items_to_classify(i,3)=stat.Energy(i);
end

%Minimum Distance Classifier
class1 = minimun_distance_classifier(mean_element, items_to_classify);

file=fopen('GroundTrue.dat','r');
dat=fscanf(file,'%d');
dat=dat';

wrong_classified=0;
for i=1:20
    if class1(i)~=dat(i)
        wrong_classified=wrong_classified + 1;
    end
end
res1=res1+wrong_classified;
%disp(wrong_classified/20);

%K Nearest Neighbour Classifier
[class2] = knn_classifier(Right_Classified,items_to_classify,3);

wrong_classified=0;
for i=1:20
    if class2(i)~=dat(i)
        wrong_classified=wrong_classified + 1;
    end
end
res2=res2+wrong_classified;
%disp(wrong_classified/20);

fclose('all');

end

res=sprintf('Euclidean Classifier precision is %f',100.0-res1/(LOOP*20)*100);
disp(res);
res=sprintf('3NN Classifier precision is %f',100.0-res2/(LOOP*20)*100);
disp(res);