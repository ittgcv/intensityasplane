iml=double((imread("tsukuba_left.png")));
imr=double((imread("tsukuba_right.png")));
subplot(1,2,1);
imshow(uint8(iml));
subplot(1,2,2);
imshow(uint8(imr));

ws=5;
dmax=16;
imdis=sadreduced(iml,imr,dmax,ws);
imshow(uint8(imdis));
nfile=strcat('imsadtsukuba',int2str(ws),'.png');
imwrite(imdis,nfile);
