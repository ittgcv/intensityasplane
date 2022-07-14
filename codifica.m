function imcoded=codifica(imagen,windowsize,threshold)
  [ren,col]=size(imagen);
  imcoded=zeros(ren,col);
  for i=windowsize+1:ren-windowsize-1
    for j=windowsize+1:col-windowsize-1
      suma=0;
      for k=-windowsize:windowsize
        for l=-windowsize:windowsize
          suma+=abs(imagen(i,j)-imagen(i+k,j+l));
        endfor
      endfor
      if suma>threshold
        imcoded(i,j)=true;
      else
        imcoded(i,j)=false;
      endif
      
    endfor
  endfor
  