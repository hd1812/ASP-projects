function speech=find_speech(data)
    threshold=0.01;
    l=length(data);
    data_r=data(end:-1:1);
    for i=1:l
        if data(i)>threshold
            first=i;
            break;
        end
    end
      
    for i=1:l
        if data_r(i)>threshold
            last=l-i+1;
            break;
        end
    end
    speech=data(first:last);
end