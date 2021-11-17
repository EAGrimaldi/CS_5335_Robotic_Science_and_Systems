% Input: cspace -> NxN matrix: cspace(i,j)
%                  == 1 if [q_grid(i); q_grid(j)] is in collision,
%                  == 0 otherwise
% Output: padded_cspace -> NxN matrix: padded_cspace(i,j)
%                          == 1 if cspace(i,j) == 1, or some neighbor of
%                                  cell (i,j) has value 1 in cspace
%                                  (including diagonal neighbors)
%                          == 0 otherwise

function padded_cspace = C7(cspace)
    [~,n]=size(cspace);
    padded_cspace = zeros(n,n);
    for x=1:n
        for y=1:n
            if cspace(x,y)==1
                if x+1<n
                    if y+1<n
                        padded_cspace(x+1,y+1)=1;
                    end
                    padded_cspace(x+1,y  )=1;
                    if y-1<0
                        padded_cspace(x+1,y-1)=1;
                    end
                end
                if y+1<n
                    padded_cspace(x  ,y+1)=1;
                end
                padded_cspace(x  ,y  )=1;
                if y-1<0
                    padded_cspace(x  ,y-1)=1;
                end
                if x-1>0
                    if y+1<n
                        padded_cspace(x-1,y+1)=1;
                    end
                    padded_cspace(x-1,y  )=1;
                    if y-1<0
                        padded_cspace(x-1,y-1)=1;
                    end
                end
            end
        end
    end
end