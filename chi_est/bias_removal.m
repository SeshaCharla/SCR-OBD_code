clear; clc;
addpath("./lib/");
data_names = load_data_names();
c = [12, 10];
fig = 1;
%%
for i = [3,6]
    dat = dat_filt_lp(get_data(data_names.tc(i), "TC"));
    %% NO-x Bias
    bias = get_nox_bias(dat.x1, dat.t, 200, 200);
    figure(fig); fig=fig+1;
    hold on;
    plot(dat.t, dat.x1, DisplayName="x1 with_bias");
    plot(dat.t, rm_nox_bias(dat.x1, dat.t, 200, 200), DisplayName="x1 bias_removed")
    plot(dat.t, dat.y1, DisplayName="y1")
    legend(Interpreter="none")
    title(data_names.tc(i), Interpreter="none");
    xlabel("time (s)");
    ylabel("NO-x (ppm)");
    grid on;
    text(1000, 60, "bias = " + string(round(bias.b0, 4)) + " t + " + string(round(bias.b1, 4)));
    %% NH3 bias
    figure(fig); fig=fig+1;
    hold on;
    plot(dat.t, dat.x2, DisplayName="with_bias");
    legend(Interpreter="none")
    title(data_names.tc(i), Interpreter="none");
    xlabel("time (s)");
    ylabel("NH_3 (ppm)");
    grid on;
    text(500, 4, "bias = " + string(round(bias.b0, 4)) + " t + " + string(round(bias.b1, 4)));
end
