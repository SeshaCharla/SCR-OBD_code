clear; clc;
addpath("lib\");
%%==
names = load_data_names();
data = {};
for i=1:6
    data{i} = get_data(names.tc(i), 'TC');
end
load("nominal.mat")
Ts = 0.2;
NF = (1/0.2) * 0.5;
max_freq = NF*0.8;
%% Identification Data
id_data = {};
for i=1:6
    y = [(data{i}.x1 - nom.x1), (data{i}.x2 - nom.x2)];
    u = [(data{i}.u1 - nom.u1), (data{i}.u2 - nom.u2), (data{i}.F - nom.F), (data{i}.T - nom.T)];
    id_data{i} = idfilt(iddata(y, u, Ts), [0, 2*pi*max_freq], 'noncausal');
    id_data{i}.InputName = {'u_1', 'u_2', 'F', 'T'};
    id_data{i}.InputUnit = {'ppm', 'ml/s', 'kg/min', 'deg-C'};
    id_data{i}.OutputName = {'x_1', 'x_2'};
    id_data{i}.OutputUnit = {'ppm', 'ppm'};
    id_data{i}.Name = names.tc(i) + "_iddata";
end
ag_data = merge(id_data{1}, id_data{2}, id_data{3});
dg_data = merge(id_data{4}, id_data{5}, id_data{6});
%% tfest Options
% Transfer function estimation                              
Options = tfestOptions;                                    
Options.InitialCondition = 'auto';                         
Options.EnforceStability = true;  
Options.WeightingFilter = [0, max_freq];
Options.InitializeMethod = 'all';
                                                           

% System Structure
G11 = idtf(NaN(1,3),[1,NaN(1,3)],'IODelay',NaN);
G11.Structure(1).IODelay.Free = true;
G11.Structure(1).IODelay.Maximum = 0.2*20;

G12 = idtf(NaN,[1,NaN(1,4)],'IODelay',NaN);
G12.Structure(1).IODelay.Free = true;
G12.Structure(1).IODelay.Maximum = 0.2*20;

G13 = idtf(NaN(1, 3),[1,NaN(1,3)],'IODelay',NaN);
G13.Structure(1).IODelay.Free = true;
G13.Structure(1).IODelay.Maximum = 0.2*20;

G14 = idtf(NaN(1, 4),[1,NaN(1,4)],'IODelay',NaN);
G14.Structure(1).IODelay.Free = true;
G14.Structure(1).IODelay.Maximum = 0.2*20;
%----------------------------------------
G21 = idtf(NaN,[1,NaN(1,3)],'IODelay',NaN);
G21.Structure(1).IODelay.Free = true;
G21.Structure(1).IODelay.Maximum = 0.2*20;

G22 = idtf(NaN(1, 3),[1,NaN(1,4)],'IODelay',NaN);
G22.Structure(1).IODelay.Free = true;
G22.Structure(1).IODelay.Maximum = 0.2*20;

G23 = idtf(NaN(1, 3),[1,NaN(1,3)],'IODelay',NaN);
G23.Structure(1).IODelay.Free = true;
G23.Structure(1).IODelay.Maximum = 0.2*20;

G24 = idtf(NaN(1, 4),[1,NaN(1,4)],'IODelay',NaN);
G24.Structure(1).IODelay.Free = true;
G24.Structure(1).IODelay.Maximum = 0.2*20;
%---
init_sys = [G11, G12, G13, G14;
            G21, G22, G23, G24];
%% Transfer Function estimation;
tf_est = {};
tf_ag = tfest(ag_data, init_sys, Options);
tf_dg = tfest(dg_data, init_sys, Options);
%% Compare plots
figure()
for i=1:3
    subplot(1, 3, i)
    compare(id_data{i}, tf_ag)
    title(names.tc(i), "Interpreter","none")
end
figure()
for i=4:6
    subplot(1, 3, i-3)
    compare(id_data{i}, tf_dg)
    title(names.tc(i), "Interpreter","none")
end
%% Bode Plots
figure()
for j=1:4
    subplot(1, 2, j)
    hold on
        bodemag(tf_ag(2, j))
        bodemag(tf_dg(2, j))
    grid on
end
legend(Interpreter="latex")