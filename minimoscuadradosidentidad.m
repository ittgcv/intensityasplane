function c=minimoscuadradosidentidad(pts)
  % en la transformada de pakal se obtiene una matriz identidad que se resuelve por simple despeje
sz=sum(pts(3,:));
%sx=sum(pts(1,:));
%sy=sum(pts(2,:));
sx2=sum(pts(1,:).*pts(1,:));
sy2=sum(pts(2,:).*pts(2,:));
%sxy=pts(1,:)*pts(2,:)';
sxz=pts(3,:)*pts(1,:)';
syz=pts(2,:)*pts(3,:)';
[np,nc]=size(pts);
%A=[nc,sx,sy;sx,sx2,sxy;sy,sxy,sy2];
%y=[sz;sxz;syz];
c=[sz/nc,sxz/sx2,syz/sy2];
%c=A\y;  % solucion de un sistema de ecuaciones
