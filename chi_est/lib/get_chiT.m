function chi = get_chiT(dat)
    %% least squares estimation of chit(T)
    chi = struct;
    d = dat.y1-dat.x1;
    C = [(dat.T .* dat.x2), -(dat.T), -dat.x2, ones(size(dat.x1))];
    lsq_dat = rm_y10(dat, C, d);
    th = lsqnonneg(lsq_dat.C, lsq_dat.d);
    chi.a = th(1);
    ab_th = th(2);
    chi.b_T = th(3);
    bTbth_b0 = th(4);
    chi.b_th = (ab_th)/(chi.a);
    chi.b_0 = (chi.b_T * chi.b_th) - bTbth_b0;
    chi.lsq_dat = lsq_dat;
end