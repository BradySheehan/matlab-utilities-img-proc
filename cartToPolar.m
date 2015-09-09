%
%Created By Brady Sheehan
%
function transformed = cartToPolar(inputMatrix)

    xc1 = 1;    %take the origin to be the top left corner
    yc1 = 1;

    for x = 1:size(inputMatrix,1)
        for y = 1:size(inputMatrix,2)

            xy1 = inputMatrix(x,y);                            %extract value at that coordinate
            r1 = sqrt( (x - xc1)^2 + (y - yc1)^2 );            %row
            a1 = radtodeg(atan( (y - yc1) / (x - xc1) ));      %columns
            
            %checks so that all the conversions from cartesian to polar are
            %mapped to logical and integer indices in the matrix 
            if x == 1   %when x equals 1, we get division by zero
                a1 = 90;
                r1 = 1;
            end
            if y == 1   %when y = 1, we are at 0 degrees, but we don't have a zero matrix index, make it 1
                a1 = 1;    
            end
            if r1 == 0  %when r1 = 0, we are in the corner, make it 1 instead
                r1 = 1;
            end
            if a1 <= 1  %can't have values that are real, need integerse
                a1 = 1;
            end
            
            polar(round(r1),round(a1)) = xy1;
            %fprintf('Row : %i Col : %i Radius : %f Theta : %f \n', x, y, r1, a1)
            
        end
    end
    
    transformed = polar;
end    