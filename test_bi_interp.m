function large_mandrill = test_bi_interp()
%%
dbstop if error
tic
sf = 4;
mandrill = load('mandrill');
new_mandrill = mandrill.X(1:10:end,1:10:end);
sizex = size(new_mandrill, 1);
sizey = size(new_mandrill, 2);



large_mandrill = zeros((sf - 1)*sizex, (sf - 1)*sizey);

% [winx, winy] = meshgrid(0:sf-1, 0:sf-1);
winz = zeros(sf - 1,sf - 1);
%for all pixes in mandril
 for ii = 1:sizex - 1
     for jj = 1:sizey - 1
        left = ii + sf/2*(ii - 1);
        right = left + sf;
        top = jj + sf/2*(jj - 1);
        bottom = top + sf;
        %interpolate to this size of a window
        for x = 0:sf - 1
            for y = 0:sf - 1
                winz(x+1,y+1) = bilinear_interp(new_mandrill(ii,jj), new_mandrill(ii+1, jj), new_mandrill(ii, jj+1), new_mandrill(ii+1, jj+1), x, y, sf);
            end
        end
        
        large_mandrill(left:right - 1, top:bottom - 1) = winz(1:sf, 1:sf);
    
     end
    ii
 end

%  figure
%  subplot(2,1,1)
%  imagesc(large_mandrill)
%  subplot(2,1,2)
%  imagesc(new_mandrill)
toc
end