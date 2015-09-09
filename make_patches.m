%
%script to break image into patches
%patches are assumed square
%example: call by saying result = make_patches (image, 1000, 1000, 9)
%         this would work for a 3000 x 3000 image
%
%Created by Brady Sheehan
%
function result = make_patches( inputImage, numPatchRows, numPatchCols, numOfPatches )
    inputImage = abs(inputImage);
    answer = createCellArrays(numOfPatches, [numPatchRows, numPatchCols]);
    
    indexInCell = 1;
    nextRow = 0;
    while nextRow < size(inputImage, 1)/numPatchCols    %loop over the number of patches in one column 
        
        currCol = 0;
        for currRow = 1:numPatchRows:size(inputImage,1) %process each patch across that row
           if currRow == 1 
              temp = inputImage( 1 + nextRow*numPatchCols:numPatchCols + nextRow*numPatchCols,currRow : numPatchRows );
           end
           if currRow > 1
              temp = inputImage( 1 + nextRow*numPatchCols:numPatchCols + nextRow*numPatchCols,currRow : numPatchRows + currCol*numPatchRows ); 
           end
           answer{indexInCell} = temp;
           currCol = currCol + 1;
           if currCol == numPatchRows %we finished processing this row, 
                                      %need to go to the next row
               break
           end
           indexInCell = indexInCell + 1; %keeps track of where the patch is being stored in the cell array
        end
        nextRow = nextRow + 1; %increment this to get to the next row of the inputImage
    end
    
    result = answer;
        %how you can print the contents of each cell in the cell array
%     for ii = 1:numOfPatches
%         figure,imagesc(result{ii}),colormap(gray)
%     end
    
    %how you can print the contents of each cell in the cell array
%     figure,imagesc(result{1}),colormap(gray)
%     figure,imagesc(result{2}),colormap(gray)
%     figure,imagesc(result{3}),colormap(gray)
%     figure,imagesc(result{4}),colormap(gray)
%     figure,imagesc(result{5}),colormap(gray)
%     figure,imagesc(result{6}),colormap(gray)
%     figure,imagesc(result{7}),colormap(gray)
%     figure,imagesc(result{8}),colormap(gray)
%     figure,imagesc(result{9}),colormap(gray)

end