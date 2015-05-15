function [result ncw] = eval_stump(data, labels, t)
    % Splits on <=, > !!!
    positives = data > t;
    
    sum_test = sum(positives);
    sum_real = sum(labels);
    
    result = abs(sum_test - sum_real);
    
    % Simple enhancement
    ncw_1 = sum(positives & labels) / sum_real;
    
    negatives = ~positives;
    comp_labels = ~labels;
    sum_real_neg = length(labels) - sum_real;
    
    ncw_0 = sum(negatives & comp_labels) / sum_real_neg;
    
    ncw = ncw_1 + ncw_0;
end