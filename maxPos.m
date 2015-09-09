function [locx,locy, value] = maxPos(inputMatrix)
    %find location of the max point in the correlation matrix
[value, ind] = max(inputMatrix(:));
[locx,locy] = ind2sub(size(inputMatrix), ind);
end