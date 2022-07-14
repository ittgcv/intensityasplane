function analisispakal(pts)
  load pakal2.mat
  dmax=15
  iml(pts(1)-1:pts(1)+1,pts(2):pts(2)+dmax)
  imr(pts(1)-1:pts(1)+1,pts(2):pts(2)+dmax)
  c=impl(pts(1),pts(2),:);
  range = linspace (-10, 10, 10);

  f = @(x,y,c) c(1)+c(2).*x+c(3).*y;
  [X, Y] = meshgrid (range, range);
  Z = f (X, Y,c);
  surf (X, Y, Z);
  hold on
  for disparity=0:dmax
    c=impr(pts(1),pts(2)+disparity,:);
    Z = f (X, Y,c);
    surf (X, Y, Z);
  endfor
  
