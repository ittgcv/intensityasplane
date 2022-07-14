function ptsr=rotacion3d(eje,grados,pts)
  % 2pi=360
  % rad=grados
  angulo=grados*2*pi/360
  [ren,col]=size(pts);
  if col==3
    pts(:,4)=1;
  endif
  rx=[1,0,0,0;0,cos(angulo),sin(angulo),0;0,-sin(angulo),cos(angulo),0;0,0,0,1];
  ry=[cos(angulo),0,-sin(angulo),0;0,1,0,0;sin(angulo),0,cos(angulo),0;0,0,0,1];
  rz=[cos(angulo),-sin(angulo),0,0;sin(angulo),cos(angulo),0,0;0,0,1,0;0,0,0,1];
  if (eje=='x')
    ptsr=pts*rx;
  elseif (eje=='y')
    ptsr=pts*ry;
  else
    ptsr=pts*rz;
  endif