clear; clc;
addpath("./lib/");
data_names = load_data_names();
c = [12, 10];
fig = 1;
%%
for i = [3,6]
    dat = dat_filt_lp(get_data(data_names.tc(i), "TC"));
    %%
    bias = get_bias(dat.x1, dat.t, 20, 20);
    figure(fig); fig=fig+1;
    hold on;
    plot(dat.t, dat.x1, DisplayName="with_bias");
    plot(dat.t, rm_bias(dat.x1, dat.t, 20, 20), DisplayName="bias_removed")
    legend(Interpreter="none")
    title(data_names.tc(i), Interpreter="none");
    xlabel("time (s)");
    ylabel("NO-x (ppm)");
    grid on;
    text(1000, 60, "bias = " + string(round(bias.b0, 4)) + " t + " + string(round(bias.b1, 4)));
    %% 
end
