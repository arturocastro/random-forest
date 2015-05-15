classdef rforest < handle
   properties
      trees = dectree;
      
      trainedtrees;
      maxtrees;
      
      split_fn;
      stepsize;
      random;
      enhance;
      
      predicted_labels;
   end
    
   methods
       function obj = rforest(pmaxdepth, pminex, pmaxtrees, split_fn, stepsize, random, enhance)
           if nargin < 3
               return;
           end
           
           if nargin < 4
               % Default is gini
               split_fn = 0;
           end

           if nargin < 5
              % Default is 0.01
              stepsize = 0.01;
           end

           if nargin < 6
               % Default is not to randomize (Extremely!)
               random = 0;
           end

           if nargin < 7
               % Default is not to enhance (simply!)
               enhance = 0;
           end
           
           %split_fn
           %stepsize
           %random
           %enhance
           
           obj.maxtrees = pmaxtrees;
           obj.trainedtrees = 0;
           
           obj.trees(pmaxtrees) = dectree(pmaxdepth, pminex, split_fn, stepsize, random, enhance);
           
           for i = 1 : pmaxtrees - 1
               obj.trees(i).depth = pmaxdepth;
               obj.trees(i).minex = pminex;
               obj.trees(i).isleaf = 1;
               obj.trees(i).split_fn = split_fn;
               obj.trees(i).stepsize = stepsize;
               obj.trees(i).random = random;
               obj.trees(i).enhance = enhance;
           end
       end
       
       function model = train(self, data, labels)
           self.trainedtrees = 0;
           num_examples = length(labels);
           self.predicted_labels = zeros(num_examples, self.maxtrees);
           
           % Total features
           p = length(data(1, :));
           
           m = floor(sqrt(p));
           
           samplegen = baron(data, labels);
           
           for i = 1 : self.maxtrees
               i
               
               [tr te oob_idx] = samplegen.bootstrap;

               self.trees(i).train(tr.data, tr.labels, m);
               
               for j = 1 : num_examples
                   example = data(j, :);
                   self.predicted_labels(j, i) = self.trees(i).predict(example);
               end
               
%               self.predicted_labels

               self.trainedtrees = self.trainedtrees + 1;

               [err precision recall accuracy] = self.test(te.data, te.labels, oob_idx)
               if err < 0.45
                   
               end
           end
           
           err
           precision
           recall
           accuracy
           
           model = self;
       end
       
       function [err precision recall accuracy] = test(self, data, labels, oob_idx)
           n = length(labels);
                      
           TP = 0;
           TN = 0;
           FP = 0;
           FN = 0;
           
           correct = 0;
           
           oob_predicted_labels = self.predicted_labels(oob_idx, 1 : self.trainedtrees);
           
           for i = 1 : n
%                example = data(i, :);
%                
%                for j = 1 : self.trainedtrees
%                    self.predicted_labels(j) = self.trees(j).predict(example);
%                end


               prediction = mode(oob_predicted_labels(i));
               
               if prediction == 1
                   if labels(i) == 1
                       TP = TP + 1; 
                   else % labels(i) == 1
                       FP = FP + 1;
                   end
               else % prediction == 0
                   if labels(i) == 0
                       TN = TN + 1;
                   else % labels(i) == 1
                       FN = FN + 1;
                   end
               end
               
               if prediction == labels(i)
                   correct = correct + 1;
               end
           end
           
           P = TP + FN;
           N = FP + TN;
           
           precision = TP / (TP + FP);
           recall = TP / P;
           accuracy = (TP + TN) / (P + N);
           
           err = (TP + TN) / n;
       end
   end
end