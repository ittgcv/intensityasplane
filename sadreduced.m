function imdisparity=sadreduced(iml,imr,dmax,wcor)
  [ren,col]=size(iml);
  for i=wcor+1:ren-wcor
    for j=wcor+1:col-dmax-wcor-1
      vcor=255*4*wcor;
      disparity=0;
      for d=0:dmax
        for k=-wcor:wcor
          for l=-wcor:wcor
            vcorw=abs(iml(i+k,j+l)-imr(i+k,j+l+d));
          endfor
        endfor

        if vcorw<vcor
          vcor=vcorw;
          disparity=d;
        endif
      endfor
      imdisparity(i,j)=disparity*dmax;
    endfor
  endfor

