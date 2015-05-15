%%%

% rugby
% separable
% inseparable
% heart
% muddledata

load heart;

scaling_factor = 100.0;

r = 1 : 100;

e = zeros(max(r));

base_model = logreg();

for i = r

    learning_rate = i / scaling_factor
    
    base_model.learningrate = learning_rate; 
    
    model = base_model.train(data, labels);
    res = model.test(data, labels);

    e(i) = res.err();
    
end

plot(r ./ scaling_factor, e);
xlabel('Learning rate');
ylabel('Error');