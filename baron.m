classdef baron < handle
    properties
        data;
        labels;
        
        numexamples;
    end
    
    methods
        function obj = baron(pdata, plabels)
            if nargin < 2
               return; 
            end
            
            if length(pdata) ~= length(plabels)
                disp('Non-coherent data and labels');
                return;
            end

            obj.data = pdata;
            obj.labels = plabels;

            obj.numexamples = length(plabels);
        end
        
        function [tr te oob] = bootstrap(self)
            [newlabels idx] = datasample(self.labels, self.numexamples);
            newdata = self.data(idx, :);
            
            tr = baron(newdata, newlabels);
            
            range = 1 : self.numexamples;
            uni = unique(idx);
            oob = setxor(range, uni);
            
            te = baron(self.data(oob, :), self.labels(oob, :));
        end
    end
end