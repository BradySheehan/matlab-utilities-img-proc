%
%Program will pad inputImage on each side by numberOfPixelsToPadBy
%
%input real valued images only
%
%Created by Brady Sheehan
%

function result = pad_image_nonsquare(inputImage, left, right, top, bottom)
    
    newSizeMatrix = zeros(size(inputImage, 1) + top + bottom, size(inputImage, 2) + left + right);   
    newSizeMatrix(top + 1:size(inputImage,1) + bottom, left + 1:size(inputImage,2) + right) = inputImage(:,:);
    
%   slower version, but does work! it just moves all the pixels individually...     
%     for ii = 1:size(inputImage,1)
%         for jj = 1:size(inputImage,2)
%             newSizeMatrix(ii + top, jj + left) = inputImage(ii,jj);
%         end
%     end
    
    result = newSizeMatrix;
end