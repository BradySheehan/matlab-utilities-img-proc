%
% calculates a new z value by bilinearly interpolating with the 4
% neighboring values
%
% (f00)o------------------o(f10)
%      |                  |
%      |                  |
%      |       o(x,y)     |
%      |                  |
%      |                  |
% (f01)o------------------o(f11)
%
% pass in the image, 4 points, and the xy location to interpolate
% this assumes the image is mxn
% z
function newz = bilinear_interp(f00, f10,f01,f11, x, y, sf)
% need to pass in 4 corner points of a patch
% and compute the A(x,y) and the B(x,y) where A(x,y) is the polynomial for
% the x locations and B(x,y) is the polynomial for the y locations then for
% testing pass in one of the endpoints and make sure that I get that end
% point back
% f(x,y) = [ (1 - x) x][f00 f01; f10 f11][(1-y); y];

% assumes linear model
% % f00 = [2 2];
% % f10 = [2 3];
% % f01 = [3 2];
% % f11 = [3 3];
% % Extract the z values from the image at the four corners
% % f00t = image(f00(1),f00(2)); 
% % f10t = image(f10(1),f00(2));
% % f01t = image(f01(1),f00(2));
% % f11t = image(f11(1),f00(2));
% % convert input arguments to cell for anon function eval
% f00c = num2cell(f00t);
% f10c = num2cell(f10t);
% f01c = num2cell(f01t);
% f11c = num2cell(f11t);
% xc = num2cell(x);
% yc = num2cell(y);
% f = @(f00c, f01c, f10c, f11c, xc, yc) [1-xc xc]*[f00c f01c; f10c f11c]*[1-yc; yc];
% % return the new z value
% newz = cellfun(f, f00c, f01c, f10c, f11c, xc, yc);


% nonlinear
a00 = num2cell(f00);
a10 = num2cell((f10 - f00)/(sf - 1));
a01 = num2cell((f01 - f00)/(sf - 1));
a11 = num2cell((f11 + f00 - (f10 + f01))/(sf - 1)^2);

x = num2cell(x);
y = num2cell(y);

f = @(x,y, a00, a10, a01, a11) a00 + a10*x + a01*y + a11*x*y;

newz = cellfun(f, x, y, a00, a10, a01, a11);
end




