%
%Code to take in an image and an x and y offset and output
%an image that is adjusted by that number of pixels
%
%make sure you input a padded image with a padding that is larger than the
%offset
%
%Created By Brady Sheehan
%
function result = shiftImage(inputImage, xoffset,yoffset)
    newImage = zeros(size(inputImage,1), size(inputImage,2));
    
    for ii = 1:size(inputImage,1) - xoffset
        for jj = 1:size(inputImage,2) - yoffset
            newImage(ii,jj) = inputImage(ii + xoffset, jj + yoffset);
        end
    end
    
    result = newImage;
end
