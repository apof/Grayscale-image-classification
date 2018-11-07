function [ class ] = minimun_distance_classifier( mean_element, items_to_classify )

for i=1:20
    min_distance=double(100000);
    for j=1:6
        
        %Eucledian Distance of each item from the center of each class
        distance=sqrt((mean_element(j,1) - items_to_classify(i,1) )^2 +(mean_element(j,2) - items_to_classify(i,2) )^2 + (mean_element(j,3) - items_to_classify(i,3) )^2 );
        if(distance < min_distance) 
            min_distance=distance;
            class(i) = j;
        end
           
    end
end

end

