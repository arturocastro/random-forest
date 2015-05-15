function [best_t feat_ix] = best_split(data, labels, feats_selected, m, split_fn, stepsize, random, enhance)
    if nargin < 5
        % Default is gini
        split_fn = 0;
    end
    
    if nargin < 6
       % Default is 0.01
       stepsize = 0.01;
    end
    
    if nargin < 7
        % Default is not to randomize (Extremely!)
        random = 0;
    end
    
    if nargin < 8
        % Default is not to enhance (simply!)
        enhance = 0;
    end
    
    %split_fn
    %stepsize
    %random
    %enhance
    
    best_t = 0;
    minimpurity = 999999999.9;
    
    if m == 1
        best_t = stump(data(:, feats_selected(1)), labels, stepsize, random, m);

        feat_ix = 1;
        
        return;
    end
    
    for i = 1 : m
        current_feat = feats_selected(i);
        %tic;
        [t ncw] = stump(data(:, current_feat), labels, stepsize, random, m);
        
        %toc
        if split_fn == 0
            % Gini impurity splitting criteria
            impurity = gini(t, current_feat, data);
        else
            % Information gain splitting criteria
            %impurity = information_gain(t, n);
        end
        
        if impurity < minimpurity
            feat_ix = i;
            best_t = t;
            minimpurity = impurity;
            best_ncw = ncw;
        elseif enhance == 1 && impurity == minimpurity && ncw > best_ncw
            % Simple enhancement
            feat_ix = i;
            best_t = t;
            minimpurity = impurity;
            best_ncw = ncw;
        end
    end
end