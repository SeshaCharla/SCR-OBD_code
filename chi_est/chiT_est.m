clear; clc;
addpath("./lib/");
data_names = load_data_names();
c = [12, 10];
lsq_mats = {};
%%
for i = 1:6
    dat = dat_filt_lp(get_data(data_names.tc(i), "TC"));
    chi = get_chiT(dat);
    lsq_mats{i} = chi.lsq_dat;
    y1 = dat.x1 - chi.b_0 + ((chi.a*dat.T)-chi.b_T) .* (dat.x2 - chi.b_th); 
    %%
    figure(i);
    hold on;
    plot(dat.t, rm_nox_bias(dat.x1, dat.t, 200, 200), DisplayName="x1");
    plot(dat.t, dat.y1, DisplayName="$y_1$");
    plot(dat.t, dat.x2, DisplayName="$x_2$");
    plot(dat.t, y1, DisplayName="$\hat y_1$ (least-squares)");
    plot(dat.t, dat.T/10, DisplayName="Temp")
    grid on;
    hold off;
    legend('Interpreter','latex');
    xlabel('time (s)')
    ylabel('State')
    title(data_names.tc(i), Interpreter="none")
    text(500, 60, "a = " + string(chi.a) + "    b_T = " + string(chi.b_T))
    text(500, 50, "b_{th} = " + string(chi.b_th) + "    b_0 = " + string(chi.b_0));
    figure(30+i)
    hold on
    plot(dat.t, abs(dat.y1 - y1), DisplayName=data_names.tc(i)+" |e| with f(T)");
    %plot(dat.t, dat.T/100, DisplayName="Temp/100")
    legend(Interpreter="none");
    grid on
    xlabel("time (s)");
    ylabel("|error| $|(y - \hat y)|$", Interpreter="latex");
    title("Cross-sessitive data prediction error magnitude comparision")
end


