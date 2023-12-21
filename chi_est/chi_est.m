clear; clc;
addpath("./lib/");
data_names = load_data_names();
c = [12, 10];
%%
for i = [3,6]
    dat = get_data(data_names.tc(i), "TC");
    chiT = get_chi(dat);
    %%
    figure(1);
    hold on;
    plot(chiT.T_f, chiT.chi, DisplayName=data_names.tc(i))
    %%
    figure(i);
    hold on;
    plot(dat.t, dat.x1, DisplayName="x1");
    plot(dat.t, dat.y1, DisplayName="y1");
    plot(dat.t, dat.x2, DisplayName="x2");
    plot(dat.t, dat.T/10, DisplayName="T/10");
    plot(dat.t, chiT.chi, DisplayName="$\chi$")
    grid on;
    hold off;
    legend('Interpreter','latex');
    xlabel('time (s)')
    ylabel('State')
    title(data_names.tc(i), Interpreter="none")
    %%
    figure(3*i)
    hold on;
    plot(dat.t, chiT.chi, DisplayName="$\chi$");
    plot(dat.t, c(i/3) - (chiT.T_f/100).^2, DisplayName= string(c(i/3))+"$ - \left( \frac{T}{10} \right)^2$")
    legend('Interpreter','latex');
    xlabel('time (s)')
    ylabel('$\chi$', 'Interpreter','latex')
    title(data_names.tc(i), 'Interpreter','none')
    grid on;
end
figure(1)
legend('Interpreter','none')
ylabel('$\chi$', 'Interpreter','latex')
xlabel("T")
grid on
hold off
