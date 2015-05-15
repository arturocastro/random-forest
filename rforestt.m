classdef rforestt < handle
   properties
      trees = dtree;
      
      trainedtrees;
      maxtrees;
      
      split_fn;
      stepsize;
      random;
      enhance;
      
      predicted_labels;
   end
    
   methods
       function obj = rforestt(pmaxtrees)           
           obj.maxtrees = pmaxtrees;
           obj.trainedtrees = 0;
           
           obj.trees(pmaxtrees) = dtree;
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

               self.trees(i).train(tr.data, tr.labels);

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
           
           result = ones(1000);
           
           %oob_predicted_labels = self.predicted_labels(oob_idx, 1 : self.trainedtrees);
           
           for i = 1 : n
%                example = data(i, :);
%                
               for j = 1 : self.trainedtrees
                   result(j) = self.trees(j).test(data, labels).labels(i);
               end

               prediction = mode(result(1 : self.trainedtrees));
               
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