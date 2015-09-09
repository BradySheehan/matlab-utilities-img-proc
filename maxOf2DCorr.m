%
%input a 2d matrix of correlation coefficients
%return the location [x, y] of the max correlation coefficient
%
%Created by Brady Sheehan
%
function [locx,locy, value] = maxOf2DCorr(inputMatrix)

[value, ind] = max(inputMatrix(:));
[locx,locy] = ind2sub(size(inputMatrix), ind);
    
end