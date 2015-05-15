function impurity = gini(t, feat_selected, data)
    % Same as dectree...
    %left_p = t / n;
    %right_p = (n - t) / n;
    
    n = length(data);
    
    left_p = sum(data(:, feat_selected) < t) / n;
    right_p = 1.0 - left_p;
    
    impurity = 1 - ((left_p * left_p) + (right_p * right_p));    
end