function result = genrandmat(N, a, b)
    
    for i = 1 : N,
        
        for j = 1 : N,
       
            result = a + (b - a) .* rand(N, N);
            
        end
        
    end

end