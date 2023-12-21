function dat_f = dat_filt_lp(dat)
    dat_f = struct;
    %% Filter design
    fs = 5;
    [b, a] = butter(1, 1/(fs/2));
    %% Filtering the data\
    dat_f = dat;
    dat_f.x1 = filtfilt(b, a, dat.x1);
    dat_f.x2 = filtfilt(b, a, dat.x2);
    dat_f.y1 = filtfilt(b, a, dat.y1);
    dat_f.y3 = filtfilt(b, a, dat.y3);
    dat_f.u1 = filtfilt(b, a, dat.u1);
    dat_f.u2 = filtfilt(b, a, dat.u2);
end