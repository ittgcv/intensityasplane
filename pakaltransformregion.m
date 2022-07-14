function [impakal,imnormal,imcodepakal]=pakaltransformregion(imagen,ws)
  % impakal tiene la ecuacion del plano de cada ventana de tamano ws, double
  % imnormal vector normal de cada plano 
  % imcodepakal vector normal codificado en colores
  % imagen imagen de entrada para calculo de transformada
  % ws tamano de ventana, solo trabaja para ventanas de 3x3
  [ren,col]=size(imagen);
  imagen=double(imagen);
  impakal=zeros(ren,col,3);
  imnormal=zeros(ren,col,3);
  imcodepakal=zeros(ren,col,3);
      valor=-ws;
      cuenta=1;
      for l=1:(2*ws+1)
        valpos=-ws;
        for m=1:(2*ws+1)
          posr(cuenta)=valor;
          pos(cuenta)=valpos;
          cuenta=cuenta+1;
          valpos=valpos+1;
        end
        valor=valor+1;
      end
  for i=ws+1:ws:ren-ws
    for j=ws+1:ws:col-ws
      vw=imagen(i-ws:i+ws,j-ws:j+ws); % toma los pixeles de esa ventana
      valwindow=vw(:);  % lo transforma en un vector o fila
      pts=[pos;posr;valwindow']; % crea los puntos en el espacio
      c=minimoscuadradosidentidad(pts);
      impakal(i,j,:)=c;
      imnormal(i,j,:)=vnormal(c);
      color_pakal=codepakal(vnormal(c));
      channel(:,:,1)=repmat(color_pakal(1),2*ws+1,2*ws+1);
      channel(:,:,2)=repmat(color_pakal(2),2*ws+1,2*ws+1);
      channel(:,:,3)=repmat(color_pakal(3),2*ws+1,2*ws+1);
      imcodepakal(i-ws:i+ws,j-ws:j+ws,:)=channel;
    end
    [i,ren]
    end
  
