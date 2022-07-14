function [pakd, pakald] = SPHirschmullerD( dMAX, winSize, f, c, imL, imR)

ws=winSize; %reducci?n de nombre de la variable
tic
[impl,imnl]=pakaltransform(imL,ws);
[impr,imnr]=pakaltransform(imR,ws);
toc
1
pakald=zeros(f,c);
pakd=zeros(f,c);
tic
for i=2*ws+1:f-2*ws-1
    for j=c-(2*ws)-1:-1:(2*ws)+1+dMAX
        
        d=0;
        for k=j:-1:j-dMAX
            d=d+1;
            [hirshAng,  aminCen]= metodoHirshD(imnl, imnr, ws, k, i, j);            
            disp(2,d)=hirshAng;
            disp(3,d)=aminCen;
        end
        [minimoAngH, index]=min(disp(2,:));
        pakald(i,j)=index-1;
        [minimoAngP, index]=min(disp(3,:));
        pakd(i,j)=index-1;
    end
end
 toc
 2
pakald=double(pakald);
pakd=double(pakd);
pakaldO=uint8(pakald);
pakdO=uint8(pakd);
% figure, imshow(pakaldO);
% imwrite(pakaldO, 'image_names{im_num}HD.jpeg');
% figure, imshow(pakdO);
% imwrite(pakdO, 'image_names{im_num}PD.jpeg');
end