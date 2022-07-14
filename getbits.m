function imchain=getbits(imagen,windowsize)
  [ren,col]=size(imagen);
  imchain=zeros(ren,col);
  for i=windowsize+1:ren-windowsize-1
    for j=windowsize+1:col-windowsize-1
      valpixel=0;
      if imagen(i-windowsize,j-windowsize)==true
        valpixel=1;
      endif
      if imagen(i-windowsize,j+windowsize)==true
        valpixel+=2;
      endif
      if imagen(i+windowsize,j-windowsize)==true
        valpixel+=4;
      endif
      if imagen(i+windowsize,j+windowsize)==true
        valpixel+=8;
      endif
      if imagen(i,j)==true
        valpixel+=16;
      endif
      imchain(i,j)=valpixel;
    endfor
  endfor
  
      