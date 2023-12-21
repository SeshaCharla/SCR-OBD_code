function dat_st = get_data(name, type)
    % Generates a  structure with all the required data in appropriate names.
    % t, F, T, xi, yi, ui
    dat = read_data(name);
    dat_st = struct;
    if type == "TC"
        dat_st.t = dat.LOG_TM;
        dat_st.F = dat.EXHAUST_FLOW;
        dat_st.Tin = dat.V_AIM_TRC_DPF_OUT;
        dat_st.Tout = dat.V_AIM_TRC_SCR_OUT;
        dat_st.T = mean([dat_st.Tin'; dat_st.Tout'])';
        dat_st.u2 = dat.V_UIM_FLM_ESTUREAINJRATE;
        dat_st.u1 = dat.ENG_CW_NOX_FTIR_COR_U2;
        dat_st.x1 = dat.EXH_CW_NOX_COR_U1;
        dat_st.x2 = dat.EXH_CW_AMMONIA_MEA;
        dat_st.y3 = dat.EONOX_COMP_VALUE;
        dat_st.y1 = dat.V_SCM_PPM_SCR_OUT_NOX;
    elseif type == "TRK"
        dat_st.t = dat.tod;
        dat_st.F = dat.pExhMF;
        dat_st.T = dat.pSCRBedTemp;
        dat_st.u2 = dat.pUreaDosing;
        dat_st.u1 = dat.pNOxInppm;    % no cross correlation
        dat_st.y1 = dat.pNOxOutppm;
    end
end