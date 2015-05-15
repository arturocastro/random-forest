%%%

% rugby
% separable
% inseparable
% heart
% muddleddata

load heart;

C_set = 0.01 : 0.04 : 4;
gamma_set = 0.01 : 0.04 : 5;

length_C = length(C_set);
length_gamma = length(gamma_set);

e = zeros(length_C, length_gamma);

my_sampler = sampler(data, labels);

my_sampler.randomize();

[tr te] = my_sampler.split(1, 2);

for i = 1 : length(C_set)
    C = C_set(i);
    
    for j = 1 : length(gamma_set)
        gamma = gamma_set(j);
        
        model = svm(['-t 2 -g ', num2str(gamma), ' -c ', num2str(C)]);

        model = model.train(tr.data, tr.labels);
        res = model.test(te.data, te.labels).err();

        e(i, j) = res; 
    end
end

surf(gamma_set, C_set, e);
xlabel('gamma');
ylabel('C');
zlabel('Error');
