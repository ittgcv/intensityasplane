function [pakali] = SPHirshLeft( dMAX, winSize, f, c, imL, imR)

iml=imL;
imr=imR;
ws=winSize;

pakali = zeros(f, c);
disp= zeros(2,dMAX+1);

for i=2*winSize+1:f-winSize*2
    for j=2*winSize+1:c-2*winSize-dMAX
        d=0;
        
        for k=j:j+dMAX
            d=d+1;
              [SADbandS]= entradas(imL, imR, winSize, k, i, j);         
              disp(2,d)=SADbandS;              
        end           
        [minimoSADS, index]=min(disp(2,:));
        SADi(i,j)=index-1; 
    end 
end


end

