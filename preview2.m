reps = 10;

num_of_trees = 500;

heart_results = [];
wine_results = [];
breast_results = [];

paroptions = statset('UseParallel','Always');

for i = 1 : reps
    load heart;
    
    random_forest = TreeBagger(num_of_trees, data, labels, 'Method', 'classification', 'OOBVarImp', 'on', 'NPrint', 20, 'Options', paroptions);
    
    heart_results = [heart_results oobError(random_forest)];
    
    load breast;
    
    random_forest = TreeBagger(num_of_trees, data, labels, 'Method', 'classification', 'OOBVarImp', 'on', 'NPrint', 20, 'Options', paroptions);
    
    breast_results = [breast_results oobError(random_forest)];
    
    load wine;
    
    random_forest = TreeBagger(num_of_trees, data, labels, 'Method', 'classification', 'OOBVarImp', 'on', 'NPrint', 20, 'Options', paroptions);
    
    wine_results = [wine_results oobError(random_forest)];
end

%random_forest = TreeBagger(num_of_trees, data, labels, 'Method', 'classification', 'OOBVarImp', 'on', 'NPrint', 20);%, 'Options', paroptions);

% plot(oobError(random_forest));
% xlabel('Number of grown trees');
% ylabel('Out-of-bag classification error');
% title('Random Tree run, increasing number of trained trees');