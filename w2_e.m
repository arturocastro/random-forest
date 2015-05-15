%%%

% rugby
% separable
% inseparable
% heart
% muddleddata

load heart;

r = 0.01 : 0.05 : 2;

e = [];

my_sampler = sampler(data, labels);

my_sampler.randomize();

[tr te] = my_sampler.split(1, 2);

for i = r
    model = svm(['-t 2 -g ', num2str(i)]);

    model = model.train(tr.data, tr.labels);
    res = model.test(te.data, te.labels).err();
    
    e = [e, res];
end

plot(r, e);