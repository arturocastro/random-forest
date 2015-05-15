%%%

% rugby
% separable
% inseparable
% heart
% muddleddata

load heart;

r = 1 : 15;

e = zeros(1, length(r));

model = svm();

n = length(data);

for i = r
    my_sampler = sampler(data, labels);
    
    my_sampler.randomize();
    
    [tr te] = my_sampler.split(1, 2);

    model = model.train(tr.data, tr.labels);
    res = model.test(te.data, te.labels);

    e(i) = res.err();
end

plot(e);