clear all; close all; clc; 
iml = (imread('frame0.png'));
ws=3;
[impl,imnl,imcl]=pakaltransform(iml,ws);
  %save packal.mat
  dmax=16;
  %load packal.mat
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
        [m,a]=ab2v(vnl,vnr);    % calcula el angulo entre dos vectores y lo devuelve en a(7)
        if a(7)<amax
          amax=a(7);    % retengo el angulo minimo
          dmin=d;       % retengo el valor de disparidad correspondiente
        end
      end
            imdis(i,j)=dmin;%*dmax;
        end
      end
  imdis=uint8(imdis);
  imdis2=zeros(ren, col);
  
  for i=1:ren-ws
    for j=1:col-dmax-ws
        imdis2(i,j)=imdis(i,j);
    end
  end
   imdis2=uint8(imdis2);
  figure, imshow(imdis2);
  figure, imshow(imcl);
  figure, imshow(imcr);
  %colormap(colorcube(64))
 % save pakal8.mat 