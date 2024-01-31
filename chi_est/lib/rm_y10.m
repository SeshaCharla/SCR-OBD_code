function lsq_dat = rm_y10(dat, C, d)
    % The function removes the rows where y1 is zeros
    y1 = dat.y1;
    for i = 1:length(dat.y1)
        if (abs(y1(i)) <= 1)
            y1(i) = [];
            C(i,:) = [];
            d(i,:) = [];
            i = i-1;
        end
        if ((i == length(y1)) || i <= 0)
            break;
        end
    end
    lsq_dat = struct;
    lsq_dat.C = C;
    lsq_dat.d = d;
end