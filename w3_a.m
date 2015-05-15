%%%

% rugby
% separable
% inseparable
% heart
% muddleddata

load breast;

r = 1 : 15;

e = r;

my_sampler = sampler(data, labels);

my_sampler.randomize();

[tr te] = my_sampler.split(1, 2);

for i = r
    model = knn('k', i);

    model = model.train(tr.data, tr.labels);
    res = model.test(te.data, te.labels).err();
    
    e(i) = res;
end

plot(r, e);