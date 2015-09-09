function out = rotateBasis(xBasis,yBasis,zBasis,xBasis1,yBasis1, zBasis1)
% Get rotation matrix from M2 to M1
M1 = [xBasis(:) yBasis(:) zBasis(:)];
M2 = [xBasis1(:) yBasis1(:) zBasis1(:)];


out =M1*M2';