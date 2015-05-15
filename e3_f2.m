% rugby
% separable
% inseparable
% heart
% muddleddata

load heart;

r_min_examples = 5 : 10 : 500;

n_min_examples = length(r_min_examples);
n_reps = 100;

%training_res = zeros(n_reps, n_min_examples);
testing_res = zeros(n_reps, n_min_examples);

% repetitions
for i = 1 : n_reps
    my_sampler = sampler(data, labels);
    
    [tr te] = my_sampler.randomize.split(1, 2);
    
    % cycles minimum number of examples
    for j = 1 : n_min_examples
        model = dtree('maxdepth', 20, 'minex', r_min_examples(j));
        
        model = model.train(tr.data, tr.labels);
        
        %training_res(i, j) = model.test(tr.data, tr.labels).err();
        %size(testing_res(i, j))
        %size(model.test(te.data, te.labels).err())
        
        %model.test(te.data, te.labels).err()
        testing_res(i, j) = model.test(te.data, te.labels).err();
    end
end

%training_avg = mean(training_res, 1);
%training_e = 1.96 * std(training_res, 0, 1) / sqrt(n_reps);

testing_avg = mean(testing_res, 1);
testing_e = 1.96 * std(testing_res, 0, 1) / sqrt(n_reps);

%subplot(2, 1, 1);
%errorbar(r_min_examples, training_avg, training_e);

%subplot(2, 1, 2);
errorbar(r_min_examples, testing_avg, testing_e);
