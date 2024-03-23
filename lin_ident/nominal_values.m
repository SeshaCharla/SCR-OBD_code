clear; clc;
addpath("lib\");
%%==
names = load_data_names();
data = {};
for i=1:6
    data{i} = get_data(names.tc(i), 'TC');
end
nom = struct;
%% Plots

% x1
subplot(2, 3, 1)
hold on;
mean_data = [];
for i=1:6
    plot(data{i}.t, data{i}.x1)
    mean_data = cat(1, mean_data, data{i}.x1);
end
nom.x1 = mean(mean_data);
plot(data{3}.t, ones(size(data{3}.t))*nom.x1);
legend(cat(1, names.tc, 'Nominal Value'));
grid on;
xlabel('time (s)');
ylabel('x1 (ppm)');

% x2
subplot(2, 3, 2)
hold on;
mean_data = [];
for i=1:6
    plot(data{i}.t, data{i}.x2)
    mean_data = cat(1, mean_data, data{i}.x2);
end
nom.x2 = mean(mean_data);
plot(data{3}.t, ones(size(data{3}.t))*nom.x2);
%legend(cat(1, names.tc, 'Nominal Value'));
grid on;
xlabel('time (s)');
ylabel('x2 (ppm)');

% u1
subplot(2, 3, 3)
hold on;
mean_data = [];
for i=1:6
    plot(data{i}.t, data{i}.u1)
    mean_data = cat(1, mean_data, data{i}.u1);
end
nom.u1 = mean(mean_data);
plot(data{3}.t, ones(size(data{3}.t))*nom.u1);
%legend(cat(1, names.tc, 'Nominal Value'));
grid on;
xlabel('time (s)');
ylabel('u1 (ppm)');

% u2
subplot(2, 3, 4)
hold on;
mean_data = [];
for i=1:6
    plot(data{i}.t, data{i}.u2)
    mean_data = cat(1, mean_data, data{i}.u2);
end
nom.u2 = mean(mean_data);
plot(data{3}.t, ones(size(data{3}.t))*nom.u2);
%legend(cat(1, names.tc, 'Nominal Value'));
grid on;
xlabel('time (s)');
ylabel('u2 (ml/s)');

% F
subplot(2, 3, 5)
hold on;
mean_data = [];
for i=1:6
    plot(data{i}.t, data{i}.F)
    mean_data = cat(1, mean_data, data{i}.F);
end
nom.F = mean(mean_data);
plot(data{3}.t, ones(size(data{3}.t))*nom.F);
%legend(cat(1, names.tc, 'Nominal Value'));
grid on;
xlabel('time (s)');
ylabel('F (Kg/min)');

% T
subplot(2, 3, 6)
hold on;
mean_data = [];
for i=1:6
    plot(data{i}.t, data{i}.T)
    mean_data = cat(1, mean_data, data{i}.T);
end
nom.T = mean(mean_data);
plot(data{3}.t, ones(size(data{3}.t))*nom.T);
%legend(cat(1, names.tc, 'Nominal Value'));
grid on;
xlabel('time (s)');
ylabel('T (deg-C)');

%%
save("nominal.mat", "nom")
