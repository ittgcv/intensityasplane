function describepakal()
  imagen=imread('imL.png');
  imcolor(:,:,1)=imagen;
  imcolor(:,:,2)=imagen;
  imcolor(:,:,3)=imagen;
  x=160;
  y=205;
  ws=10;
  imcolor(x-ws:x+ws,y-ws,1)=255;
  imcolor(x-ws:x+ws,y+ws,1)=255;
  imcolor(x-ws,y-ws:y+ws,1)=255;
  imcolor(x+ws,y-ws:y+ws,1)=255;
  %imshow(uint8(imcolor));
  %imwrite(imcolor,'selectedwindow.png');
  imagen=double(imagen);
  data=imagen(x-ws:x+ws,y-ws:y+ws);
  datar=data(:);
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
        pts=double([pos;posr;datar']); % crea los puntos en el espacio
        plot3(pts(1,:),pts(2,:),pts(3,:),'+')
      c=minimoscuadradosidentidad(pts)
      vector_normal=vnormal(c)

      plotpakal(data,c,vector_normal,ws);
