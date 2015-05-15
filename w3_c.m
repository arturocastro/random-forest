load datag;

my_sampler = sampler(data, labels);

[tr te] = my_sampler.randomize.split(1, 2);

dtree_model = dtree();
dtree_model.train(tr.data, tr.labels);

logreg_model = logreg();
logreg_model.train(tr.data, tr.labels);

subplot(2, 1, 1);
plotboundary(data, labels, dtree_model);

subplot(2, 1, 2);
plotboundary(data, labels, logreg_model);
