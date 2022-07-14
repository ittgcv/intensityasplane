function imdisparity=sadcoded(iml,imr,dmax)
  [ren,col]=size(iml);
  for i=1:ren
    for j=1:col-dmax
      vcor=0;
      disparity=0;
      for d=0:dmax
        vcorw=bitand(iml(i,j),imr(i,j+d));
        if vcorw>vcor
          vcor=vcorw;
          disparity=d;
        endif
      endfor
      imdisparity(i,j)=disparity*dmax;
    endfor
  endfor
  