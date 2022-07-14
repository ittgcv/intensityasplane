function dLR=coLR( mitadL, mitadR, c, f, dMAX)
dLR=zeros (f, c);
    for i=1:1:f
        for j=1+dMAX:1:c-dMAX
            rst=mitadL(i,j);
            if mitadL(i,j) < mitadR(i, j-rst) 
                dLR(i,j) = mitadL(i,j);
            else
                dLR(i,j) = mitadR(i,j-rst);
            end
        end
    end
end