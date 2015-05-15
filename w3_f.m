load splice;

my_sampler = sampler(data, labels);

[tr te] = my_sampler.randomize.split(1, 2);

data8 = tr.data(1 : 8, :);
labels8 = tr.data(1 : 8, :);

model = dtree('maxdepth', 10);

model8 = model.train(data8, labels8);

subplot(3, 1, 1);
model8.view();

[tr te] = my_sampler.randomize.split(1, 2);

data512 = tr.data(1 : 512, :);
labels512 = tr.data(1 : 512, :);

model = dtree('maxdepth', 10);

model512 = model.train(data512, labels512);

subplot(3, 1, 2);
model512.view();
