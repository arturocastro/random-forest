load heart;

% Number of trees to grow
num_of_trees = 100;

% Total features
p = length(data(1, :));

% Number of features to select
m = max(1, floor(sqrt(p)));

prepper = sampler(data, labels);

B = cell(num_of_trees);

% Create random forest
for i = 1 : num_of_trees
    %Training
    [tr te] = prepper.bootstrap;
    
    %prepper = prepper.randomize;
    %[tr te] = prepper.split(1, 3);
    
    features_selected = datasample(1 : p, m);
    
    tr_set = tr.data(:, features_selected);
    oob_set = te.data(:, features_selected);
    
    b{i} = dtree();
    
    b{i}.train(tr_set, tr.labels);
    
    % Testing
    results = b{i}.test(te.data, te.labels);
    
    results.err
end


