% rugby
% separable
% inseparable
% heart
% muddleddata

load breast;

r = 1 : 15;

n_k = length(r);
n_reps = 10;

res = zeros(n_k, n_reps);

% repetitions
for i = 1 : n_reps
    my_sampler = sampler(data, labels);
    
    my_sampler.randomize();
    
    [tr te] = my_sampler.split(1, 2);
    
    % cycles k
    for j = r
        model = knn('k', j);
        
        model = model.train(tr.data, tr.labels);
        res(i, j) = model.test(te.data, te.labels).err();
    end
end

avg = mean(res, 1);
e = 1.96 * std(res, 0, 1) / sqrt(n_reps);

errorbar(r, avg, e);
ylim([0 1]);