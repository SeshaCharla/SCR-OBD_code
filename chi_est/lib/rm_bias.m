function y = rm_bias(yb, t, n_s, n_t)
    % Remove bias from the time-series data\
    bias = get_bias(yb, t, n_s, n_t);
    b_0 = bias.b0;
    b_1 = bias.b1;
    %% removing the bias
    y = yb - (b_0 * t + b_1);
end

