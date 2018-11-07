function [ result ] = knn_classifier( Right_classified, items_to_classify, k )

for i=1:20
    counter=0;
    for class=1:6
        for j=1:4
            counter=counter+1;
            field1 = 'dist';
            value1 =sqrt((Right_classified(j,1,class) - items_to_classify(i,1) )^2 +(Right_classified(j,2,class) - items_to_classify(i,2) )^2 + (Right_classified(j,3,class) - items_to_classify(i,3) )^2 );
            field2 = 'class';
            value2 = class;
            s = struct(field1,value1,field2,value2);
            distance(i,counter)= s;
        end
    end
    %sort distances
    Afields = fieldnames(distance(i,:));
    Acell = struct2cell(distance(i,:));
    sz = size(Acell);
    Acell = reshape(Acell, sz(1), []);     
    Acell = Acell';                         
    Acell = sortrows(Acell, 1);
    Acell = reshape(Acell', sz);
    Asorted = cell2struct(Acell, Afields, 1);
    
    temp=zeros(6,'uint8');
    for kk=1:k
        temp(Asorted(kk).class)=temp(Asorted(kk).class)+1;
    end
    max=0;
    for kk=1:6
        if temp(kk) > max
            max = temp(kk);
            c = kk;
        end
    end
    result(i) = c;
    
    
end


end

