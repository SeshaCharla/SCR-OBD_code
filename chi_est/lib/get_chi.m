function chiT = get_chi(dat)
    chiT = struct;
    %% Filter design
    fs = 5;
    [b, a] = butter(1, 1/(fs/2));
    %% Filtering the data\
    x1_f = filtfilt(b, a, dat.x1);
    y1_f = filtfilt(b, a, dat.y1);
    x2_f = filtfilt(b, a, dat.x2);
    chiT.T_f = filtfilt(b, a, dat.T);
    %% Calculating chi
    chiT.chi = (y1_f - x1_f)./x2_f;
end

