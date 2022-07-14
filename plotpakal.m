function plotpakal(datawindow,pakalplane,vector_normal,ws)
  % muestra la transformada usando codigo de colores
  % datawindow=pixeles en la ventana
  % pakalplane=ecuacion del plano de la ventana
  % vector_normal=ecuacion del vector normal al plano
  % ws=tamaño de la ventana
  valwindow=double(datawindow(:));
  % asigna indices a los pixeles
      valor=-ws;
      cuenta=1;
      for l=1:(2*ws+1)
        valpos=-ws;
        for m=1:(2*ws+1)
          posr(cuenta)=valor;
          pos(cuenta)=valpos;
          cuenta=cuenta+1;
          valpos=valpos+1;
        endfor
        valor=valor+1;
      endfor
      
      pts=[pos;posr;valwindow']; % crea los puntos en el espacio
      
      %d=minimoscuadradosidentidad(pts)
      c=pakalplane(:)
      f = @(x,y) c(1)+c(2).*x+c(3).*y;
      range = linspace (-8, 8, 41);
      [X, Y] = meshgrid (range, range);
      Z = f (X, Y,c);
  surf (X, Y, Z);
  hold on
  plot3(pts(1,:),pts(2,:),pts(3,:),'+')
  %pnormal(1,:)=vector_normal;
  %pnormal(2,:)=vector_normal*1000;
  %pnormal=pnormal'
  %plot3(pnormal(1,:),pnormal(2,:),pnormal(3,:),'+')
  quiver3(vector_normal(1),vector_normal(2),vector_normal(3),pts(1,1),pts(2,1),pts(3,1));
  zlabel('gray level')
  saveas(1,'pakalplane.eps');  % dibuja el vector normal
  lvr=[0,0,0,1;1,1,0,1;1,1,1,1;1,0,1,1;2,-1,1,1;2,-1,0,1;3,-1,-1,1;3,0,-1,1;4,1,-1,1];
  cvr=[0,0,0];
  figure, 
  for i=1:9
    data=[lvr(i,2:4);cvr];
    plot3(data(:,1),data(:,2),data(:,3),'-')
    hold on
  endfor
  xlabel('i');
  ylabel('j');
  zlabel('k');
  saveas(2,'pakalvectors.png');