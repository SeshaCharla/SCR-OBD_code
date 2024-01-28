clear; clc;
addpath("./lib/");
data_names = load_data_names();
lsq_mats = {};
c = [12, 10];
%%
for i = 1:6
    i
    dat = dat_filt_lp(get_data(data_names.tc(i), "TC"));
    [chi, lsq_dat] = get_chi(dat);
    lsq_mats{i} = lsq_dat;
    y1 = dat.x1 + (chi(1) * (dat.x2)) - chi(2); 
    %%
    figure(i);
    hold on;
    plot(dat.t, dat.x1, DisplayName="x1");
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
    text(500, 60, "chi = " + string(chi(1)) + "    b = " + string(chi(2)))

    figure(30+i)
    hold on
    plot(dat.t, abs(dat.y1 - y1), DisplayName=data_names.tc(i) + " e");
    %plot(dat.t, dat.T/100, DisplayName="Temp/100")
    legend(Interpreter="none");
    grid on
    xlabel("time (s)");
    ylabel("|error| $|(y - \hat y)|$", Interpreter="latex");
    title("Cross-sessitive data prediction error magnitude comparision")
end

