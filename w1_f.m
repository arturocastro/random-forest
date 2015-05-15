%%%

% rugby
% separable
% inseparable
% heart
% muddledata

load heart;

r = 1 : 50;

e = zeros(1, length(r));

base_model = logreg(1, 0.01);

n = length(data);

data_1 = data(1 : n / 2, :);
labels_1 = labels(1 : n / 2);

data_2 = data(n / 2 + 1 : n, :);
labels_2 = labels(n / 2 + 1 : n, :);

for i = r
    
    base_model = base_model.train(data_1, labels_1);
    res = base_model.test(data_2, labels_2);
    e(i) = res.err();

end

plot(r, e, 'g');
xlabel('Epochs');
ylabel('Error');