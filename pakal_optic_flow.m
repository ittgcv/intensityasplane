%% flujo optico por pakal
iml=imread('impakallandingl7.png');
imr=imread('impakallandingr7.png');
ws=7;
[ren,col,com]=size(iml)
%[impl,imnl,imcl]=pakaltransform(imbyn,ws);
subplot(2,1,1);
imshow(iml);
subplot(2,1,2);
imshow(imr);
%nfile=strcat('impakallandingr',int2str(ws),'.png');
%imwrite(imcl,nfile);
mink=0;
minl=0;
imflow=zeros(ren,col,com);
for i=1+ws:ren-ws
  for j=1+ws:col-ws
    for k=-ws:ws
      for l=-ws:ws
        if iml(i,j,:)==imr(i+k,j+l,:)
          mink=k;
          minl=l;
        endif
      endfor
    endfor
    if mink<=0&&minl<=0
      imflow(i,j,:)=[255,0,0];
    endif
    if mink<=0&&minl>0
      imflow(i,j,:)=[0,255,0];
    endif
    if mink>0&&minl<=0
      imflow(i,j,:)=[0,0,255];
    endif
    if mink>0&&minl>0
      imflow(i,j,:)=[255,255,0];
    endif
  endfor
 endfor
 figure, imshow(uint8(imflow));

