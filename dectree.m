classdef dectree < handle
    properties
        left_child;
        right_child;
        
        minex;
        isleaf;
        depth;
        
        best_feat;
        best_t;
        
        split_fn;
        stepsize;
        random;
        enhance;
    end
    
    methods
        function obj = dectree(maxdepth, minex, split_fn, stepsize, random, enhance)
            if nargin < 2
                return;
            end
            
            if nargin < 3
                % Default is gini
                split_fn = 0;
            end

            if nargin < 4
               % Default is 0.01
               stepsize = 0.01;
            end

            if nargin < 5
                % Default is not to randomize (Extremely!)
                random = 0;
            end

            if nargin < 6
                % Default is not to enhance (simply!)
                enhance = 0;
            end
            
            obj.depth = maxdepth;
            obj.minex = minex;
            
            obj.isleaf = 1;
            
            % Additional options
            obj.split_fn = split_fn;
            obj.stepsize = stepsize;
            obj.random = random;
            obj.enhance = enhance;
        end
        
        function model = train(self, data, labels, m)           
            if length(unique(labels)) == 1 %|| self.depth == 0 || length(data) < self.minex
                return;
            end
            
            % Total features
            p = length(data(1, :));
            
            features_selected = datasample(1 : p, m);
            
            %features_selected
            
            [self.best_t feat_ix] = best_split(data, labels, features_selected, m, self.split_fn, self.stepsize, self.random, self.enhance);
            %self.best_t
            %self.feat_ix
            
            self.best_feat = features_selected(feat_ix);
            
            % Partition data by filtering by t (actual) value.
            % Refer to eval_stump
            
            left_idx = find(data(:, self.best_feat) <= self.best_t);
            left_data = data(left_idx, :);
            left_labels = labels(left_idx);
            
            right_idx = find(data(:, self.best_feat) > self.best_t);
            right_data = data(right_idx, :);
            right_labels = data(right_idx);
            
            self.isleaf = 0;
            
            self.left_child = dectree(self.depth - 1, self.minex, self.split_fn, self.stepsize, self.random, self.enhance);
            self.right_child = dectree(self.depth - 1, self.minex, self.split_fn, self.stepsize, self.random, self.enhance);
            
            self.left_child.train(left_data, left_labels, m);
            self.right_child.train(right_data, right_labels, m);
            
            model = self;
        end
        
        function vote = predict(self, example)
            tree = self;
           
            while tree.isleaf == 0
                if example(tree.best_feat) > tree.best_t
                    vote = 1;
                    tree = tree.right_child;
                else
                    vote = 0;
                    tree = tree.left_child;
                end
            end
            
            %example(tree.best_feat)
            %tree.best_t
            
            %if example(tree.best_feat) > tree.best_t
            %    vote = 1;
            %    vote
            %else
            %    vote = 0;
            %    vote
            %end
        end
    end
end