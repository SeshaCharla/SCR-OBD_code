function [chi, lsq_dat] = get_chi(dat)
    %% Using least-squares for estimating the ammonia cross-sensitivity
    d = dat.y1-dat.x1;
    C = [dat.x2, -ones(size(dat.x1))];
    lsq_dat = rm_y10(dat, C, d);
    chi = lsqnonneg(lsq_dat.C, lsq_dat.d);
end

