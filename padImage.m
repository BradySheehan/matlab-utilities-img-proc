%
%Program will pad inputImage on each side by numberOfPixelsToPadBy
%
%input real valued images only
%
%Created by Brady Sheehan
%

function result = padImage(inputImage, numberOfPixelsToPadBy)
    
    newSizeMatrix = zeros(size(inputImage, 1) + 2*numberOfPixelsToPadBy, size(inputImage, 2) + 2*numberOfPixelsToPadBy);
    
    for ii = 1:size(inputImage,1)
        for jj = 1:size(inputImage,2)
            newSizeMatrix(ii + numberOfPixelsToPadBy, jj + numberOfPixelsToPadBy) = inputImage(ii,jj);
        end
    end
    
    result = newSizeMatrix;
end