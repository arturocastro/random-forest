%%%

% rugby
% separable
% inseparable
% heart
% muddledata

load heart;

model = logreg();
model = model.train(data, labels);
res = model.test(data, labels);

e = res.err();
