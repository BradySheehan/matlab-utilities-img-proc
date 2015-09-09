%
%creates empty cell array that has numArrays dimensions each of size [sizeOf1, sizeOf2]
%
%call like result = createArrays(10, [300, 300]);
%
%Created by Brady Sheehan 
function result = createCellArrays(numArrays, sizeOf)
    result = cell(1, numArrays);
    for ii = 1:numArrays
        result{ii} = zeros(sizeOf);
    end
end