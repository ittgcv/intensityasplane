iml=imread('tsukubal.png');
#imbyn=rgb2gray(iml);
imbyn=iml;
#imbynfiltered=imsmooth(imbyn,'Gaussian',4);
imbynfiltered=imbyn
ws=5;
[impl,imnl,imcl]=pakaltransformregion(imbynfiltered,ws);
nfile=strcat('impakaltsukuba',int2str(ws),'.png');
imwrite(imcl,nfile);
bw=im2bw(imbynfiltered,.4);
bw=not(bw);
inew=imcl.*repmat(bw,[1,1,3]);
inew=imcl;
subplot(2,2,1), imshow(imbyn)
subplot(2,2,2), imshow(imbynfiltered)
subplot(2,2,3), imshow(bw)
subplot(2,2,4), imshow(inew)
%imdot=detecta_codorniz(imcl,ws);
%figure, imshow(imdot);