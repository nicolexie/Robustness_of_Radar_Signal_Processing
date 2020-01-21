function [min_dis] = min_distance_1D(array)
% a function te return the minist interval 
% between every elements in an array

sorted_arr = sort(array);
min_dis = Inf;
for i = 1 : length(sorted_arr)-1
    if abs(sorted_arr(i) - sorted_arr(i+1)) < min_distance
        min_dis = abs(sorted_arr(i) - sorted_arr(i+1));
    end
end

end