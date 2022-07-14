vnormal=@(c) [c(2)/(c(1)*c(1)+c(2)*c(2)+c(3)*c(3)),c(3)/(c(1)*c(1)+c(2)*c(2)+c(3)*c(3)),1/(c(1)*c(1)+c(2)*c(2)+c(3)*c(3))];
ima=imread('tsukubal.png');
imr=imread('tsukubar.png');
p=[100,100];
ws=1;
valwindow=ima(p(1)-ws:p(1)+ws,p(2)-ws:p(2)+ws)
vw=double(valwindow(:));
posr=[repmat(-1,1,2*ws+1),repmat(0,1,2*ws+1),repmat(1,1,2*ws+1)];
pos=repmat(-ws:ws,1,2*ws+1);
pts=[pos;posr;vw'];
range = linspace (-10, 10, 10);
c=minimoscuadrados(pts);
vnl=vnormal(c)
f = @(x,y,c) c(1)+c(2).*x+c(3).*y;
[X, Y] = meshgrid (range, range);
Z = f (X, Y,c);
surf (X, Y, Z);
hold on
plot3(pts(1,:),pts(2,:),pts(3,:),'*r')
amax=180;
dmin=0;
for d=0:16
valwindow=imr(p(1)-ws:p(1)+ws,p(2)-ws+d:p(2)+ws+d)
vw=double(valwindow(:));
pts=[pos;posr;vw'];
ecpr=minimoscuadrados(pts);
vnr=vnormal(ecpr);
ZZ = f (X, Y,ecpr);
surf (X, Y, ZZ);
[m,a]=ab2v(vnl,vnr);
a(7)
if a(7)<amax
  amax=a(7);
  dmin=d;
endif

endfor
dmin