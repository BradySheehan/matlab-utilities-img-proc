%
%Program will trim inputImage by amounts of left, right, top, bottom
%
%input real valued images only
%
%Created by Brady Sheehan
%
%%

function result = trim_image_nonsquare(inputImage, left, right, top, bottom)
    
    newSizeMatrix = zeros(size(inputImage, 1) - top - bottom, size(inputImage, 2) - left - right);
    
    %start moving pixels at 
    
    for ii = 1:size(newSizeMatrix,1)
        for jj = 1:size(newSizeMatrix,2)
            newSizeMatrix(ii, jj) = inputImage(ii + top ,jj + left);
        end
    end
    
    result = newSizeMatrix;
end