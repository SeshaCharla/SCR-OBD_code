function ranges = test_cell_ranges(tab)
    % the variable names in all the tables is same
    % F        = tab.EXHAUST_FLOW
    % T_SCR    = tab.V_AIM_TRC_SCR_OUT
    % C_NOx,in = tab.ENG_CW_NOX_FTIR_COR_U2
    % C_Nox    = tab.EXH_CW_NOX_COR_U1
    % C_NH3    = tab.EXH_CW_AMMONIA_MEA
    ranges.F = [min(tab.EXHAUST_FLOW), max(tab.EXHAUST_FLOW)];
    ranges.T = [min(tab.V_AIM_TRC_SCR_OUT), max(tab.V_AIM_TRC_SCR_OUT)];
    ranges.NOxin =[min(tab.ENG_CW_NOX_FTIR_COR_U2), max(tab.ENG_CW_NOX_FTIR_COR_U2)];
    ranges.Nox = [min(tab.EXH_CW_NOX_COR_U1), max(tab.EXH_CW_NOX_COR_U1)];
    ranges.NH3 = [min(tab.EXH_CW_AMMONIA_MEA), max(tab.EXH_CW_AMMONIA_MEA)]
end