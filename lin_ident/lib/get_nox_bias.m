function bias = get_nox_bias(yb, t, n_s, n_t)
    % Get bias parameters b(t) = b_1 * t + b_0
    bias = struct;
    offset = 5;
    %% Get bias from the data
    if n_s <= offset
        n_s = 2*offset;
    end
    if n_t <= offset
        n_t = 2*offset;
    end
    b_s = mean(yb(offset:n_s));
    b_t = mean(yb(end-n_t:end-offset));
    b_0 = (b_s - b_t)/t(end);
    b_1 = b_s;
    bias.b1 = b_1;
    bias.b0 = b_0;
end

