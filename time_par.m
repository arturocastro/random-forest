reps = 10;

num_of_trees = 200;

heart_results = [];
wine_results = [];
breast_results = [];

paroptions = statset('UseParallel','Always');

for i = 1 : reps
    tic;
    random_forest = TreeBagger(num_of_trees, data, labels, 'Method', 'classification', 'OOBVarImp', 'on');
    toc
end

for i =  1 : reps
    tic;
    random_forest = TreeBagger(num_of_trees, data, labels, 'Method', 'classification', 'OOBVarImp', 'on', 'Options', paroptions);
    toc
end

% Experiments were run using MATLAB's TreeBagger class, training 200 trees
% and repeating the experiment 10 times. The number of MATLAB workers was
% obtained with matlabpool('size'). The test CPU is an Intel Xeon E5-2420
% with 6 physical cores.