load verymuddled;

my_sampler = sampler(data, labels);

[tr te] = my_sampler.randomize.split(1, 2);

model = dtree();
model.train(tr.data, tr.labels);

subplot(1, 2, 1);
model.view();

subplot(1, 2, 2);
plotboundary(data, labels, model);
