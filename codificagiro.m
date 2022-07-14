function imcoded=codificagiro(imagen,windowsize,threshold)
  % obtiene un valor proporcional a la diferencia del pixel central y sus vecinos
  % diferenciamaxima=255*4*(windowsize+1)
  [ren,col]=size(imagen);
  imcoded=zeros(ren,col);
  imagen=double(imagen);
  vmax=255*4*(windowsize+1);
  for i=windowsize+1:ren-windowsize-1
    for j=windowsize+1:col-windowsize-1
      suma=0;
      for k=-windowsize:windowsize
        for l=-windowsize:windowsize
          suma+=abs(imagen(i,j)-imagen(i+k,j+l));
        endfor
      endfor
      imcoded(i,j)=(suma/vmax)*255;
    endfor
  endfor
  imcoded=uint8(imcoded);
  