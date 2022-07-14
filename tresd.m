ptso=[0,0,1;5,0,1;10,0,1;10,5,1;10,10,1;0,10,1;5,5,1]
pts=rotacion3d('x',15,ptso);
pcam=[0,0,0;1,0,0;1,1,0;0,1,0;0,0,0;0.5,0.5,0.5;1,0,0;0.5,0.5,0.5;1,1,0;0.5,0.5,0.5;0,1,0;0.5,0.5,0.5];
pcam(:,4)=1;
mt=[1,0,0,0;0,1,0,0;0,0,1,0;2,2,10,1]
pcamt=pcam*mt;
c=minimoscuadrados(pts);
f = @(x,y) c(1)+c(2).*x+c(3).*y;
range = linspace (-8, 8, 41);
[X, Y] = meshgrid (range, range);
Z = f (X, Y,c);
surf (X, Y, Z);
hold on
plot3(pcamt(:,1),pcamt(:,2),pcamt(:,3))
