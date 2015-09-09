%
%input a 2d matrix of correlation coefficients
%return the offset pair [x,y] of the max correlation coefficient from the center
%
%Created by Brady Sheehan
%
%matlab notation is [column location, row location]
function [offsetCol, offsetRow, peak_value, mean_peak_value] = findCorrOffset(inputCorrMatrix)
    %find the center of the matrices
%     xc = round( size( inputCorrMatrix,1)/2 );
%     yc = round( size( inputCorrMatrix,2)/2 );
    
    %find location of the maximum correlation coefficient
    [maxRowLoc, maxColLoc, peak_value] = maxOf2DCorr(inputCorrMatrix);
    mean_peak_value = peak_value/mean2(abs(inputCorrMatrix));
    %find the amount of the offset
    offsetRow = round( maxRowLoc - size( inputCorrMatrix,1)/2 );
    offsetCol = round( maxColLoc - size( inputCorrMatrix,2)/2 );
end

%
%input a 2d matrix of correlation coefficients
%return the location [x, y] of the max correlation coefficient
%
%Created by Brady Sheehan
%
function [rowLoc, colLoc, value] = maxOf2DCorr(inputMatrix)
value = 0;
[value, ind] = max(inputMatrix(:));
[rowLoc, colLoc] = ind2sub(size(inputMatrix), ind);
    
end