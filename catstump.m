function best_t = catstump(data, labels)
    minerr = 999999999.9;
    best_t = 0;
    
    for t = 1 : length(data)
        err = eval_stump(data, labels, data(t));
        
        if err < minerr
            minerr = err;
            best_t = t;
        end
    end    
end