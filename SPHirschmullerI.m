function [paki,pakali]  = SPHirschmullerI( dMAX, winSize, f, c, imL, imR)

ws=winSize; %reducci?n de nombre de la variable
tic
[impl,imnl]=pakaltransform(imL,ws);
[impr,imnr]=pakaltransform(imR,ws);
toc
3
pakali=zeros(f,c);
paki=zeros(f,c);
tic
for i=(2*ws)+1:f-(2*ws)-1
    for j=2+(2*ws):c-(2*ws)-dMAX-1
        d=0;      
        for k=j:j+dMAX
            d=d+1;
            [hirshAng,  aminCen]= metodoHirshI(imnl, imnr, ws, k, i, j);            
            disp(2,d)=hirshAng;
            disp(3,d)=aminCen;
        end
        [minimoAngH, index]=min(disp(2,:));
        pakali(i,j)=index-1;
        [minimoAngP, index]=min(disp(3,:));
        paki(i,j)=index-1;
    end
end
toc   
4
55555
pakali=double(pakali);
paki=double(paki);
pakaliO=uint8(pakali);
pakiO=uint8(paki);
% figure, imshow(pakaliO);
% imwrite(pakaliO, 'image_names{im_num}HI.jpeg');
% figure, imshow(pakiO);
% imwrite(pakiO, 'image_names{im_num}PI.jpeg');
end