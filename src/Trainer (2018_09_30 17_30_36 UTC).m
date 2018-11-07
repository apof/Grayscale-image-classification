function [ result,mean_element ] = Trainer()

% A helping program for the project of 2016
%Read labeled images and compute the three feature components.
features=zeros(6,4,3);% Matrix to save all features
for texture=1:6
    for item=1:4
      im=imread(['labelled_samples\ld_smpl_',char(48+texture),'_'...
            ,char(48+item),'.tif']);
        sss=graycomatrix(im,'offset',[0 1]);%Constuct 8X8 Cooccuraance Matix
        % Compute 'contrast','homogeneity','Correlation' from the
        % Cooccurance Matrix
        stats = graycoprops(sss,{'Contrast','Homogeneity','Energy'});
        %Be careful! stats is a stuctured variable
        features(texture,item,1)=stats.Contrast/10;
        features(texture,item,2)=stats.Homogeneity;
        features(texture,item,3)=stats.Energy;

    end
end
%
% Plot all features in the three dimetion space
%
c=char('b','g','r','c','k','y');%blue, green, red, cyan ,black and yellow 
%colors for 1,2,3,4,5,6 classes

%figure;

for texture=1:6
    % By squeeze we copy data from 3 dimension array to 2 or 1 dimension
    % array
    fea1=squeeze(features(texture,:,1));
    fea2=squeeze(features(texture,:,2));
    fea3=squeeze(features(texture,:,3));
    for j=1:4
        result(j,1,texture)=fea1(j);
        result(j,2,texture)=fea2(j);
        result(j,3,texture)=fea3(j);
    end
    
    mean_element(texture,1)=mean(fea1);
    mean_element(texture,2)=mean(fea2);
    mean_element(texture,3)=mean(fea3);
    %plot3(fea1,fea2,fea3,char([c(texture),'.']));hold on;
    %plot3(x,y,z,char(['m','.']));hold on;
end
end

