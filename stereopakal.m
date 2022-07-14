clear all; close all; clc;
iml = imresize(rgb2gray(imread('video3_020.jpg')),.5);
imr = imresize(rgb2gray(imread('video3_021.jpg')),.5);

  ws=20;
  [impl,imnl,imcl]=pakaltransform(iml,ws);
  [impr,imnr,imcr]=pakaltransform(imr,ws);
  %save packaltsukubaw3.mat
  dmax=16;
  %load packaltsukubaw3.mat
  [ren,col]=size(iml);
  for i=ws+1:ren-ws
  %for i=100:100
    for j=ws+1:col-ws-dmax
    %for j=100:101
      vnl(1:3)=imnl(i,j,:); % vector normal de la ventana en la imagen izquierda
      amax=180; % angulo maximo
      dmin=0;
      for d=0:dmax
        vnr(1:3)=imnr(i,j+d,:); % vector normal de la ventana en la imagen derecha + d
        [a]=ab2v(vnl,vnr);    % calcula el angulo entre dos vectores y lo devuelve en a(7)
        if a<amax
          amax=a;    % retengo el angulo minimo
          dmin=d;       % retengo el valor de disparidad correspondiente
        end
      end
            imdis(i,j)=dmin*dmax;
        end
      end
  imdis=uint8(imdis);
  save packallandingw20.mat

  figure, imshow(imdis);
  figure, imshow(imcl);
  figure, imshow(imcr);
  %colormap(colorcube(64))
 % save pakal8.mat
