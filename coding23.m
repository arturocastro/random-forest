function [sum_of_all, sum_of_gt, m] = coding23(mat)

    sum_of_all = sum(mat(:));
    
    sum_of_gt = sum(mat(:) > 0);
    
    m = mat;
    
    n = size(m);
    
    for i = 1 : n
        
       for j = 1 : n
          
           if m(i, j) > 0
              
               m(i, j) = 0;
               
           end
           
       end
        
    end

end