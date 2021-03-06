function [P, Tx, Rx] = new_arrays(Tx, Rx, Lmax, min_interval, radarParameter, sigma)

Y = [Tx;Rx];
new_Y = Y + sqrt(sigma) .* randn(size(Y));
new_Y(1,:) = Tx(1, :);

while(max(new_Y(:)) > Lmax || min(new_Y(:)) < 0 ||...
      min_distance_1D(new_Y(:,1)) < min_interval || ...
      min_distance_1D(new_Y(:,2)) < min_interval) 
    new_Y = Y + sqrt(sigma) .* randn(size(Y));
    new_Y(1,:) = Tx(1, :);
end

Tx = new_Y(1:size(Tx, 1), :);
Rx = new_Y(size(Tx, 1)+1 : end, :);

P = to_virture_arrays(Tx, Rx, radarParameter);
end