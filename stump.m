function [best_t best_ncw] = stump(data, labels, stepsize, random, m)
    if nargin < 3
        stepsize = 0.01;
    end
    
    if nargin < 4
        random = 0;
    end
    
    r = min(data) : stepsize : max(data);

    if random == 1 && length(r) ~= 1
        r = datasample(r, m);
    end
    
    minerr = 999999999.9;
    best_t = 0;
    
    for t = r
        [err ncw] = eval_stump(data, labels, t);
        %t
        if err < minerr
            %err
            minerr = err;
            best_t = t;
            best_ncw = ncw;
        end
    end    
end