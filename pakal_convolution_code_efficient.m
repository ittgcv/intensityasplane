function [impakal_gray,impakal_color]=pakal_convolution_code_efficient(ca,cb,cc)
  % codifica con colores falsos la direccion del vector normal, solo del cuadrante norte
  % lut_vector_referencia=[cuadrante,i,j,k]
  lut_vector_referencia=[0,0,1;1,0,1;1,1,1;0,1,1;-1,1,1;-1,0,1;-1,-1,1;0,-1,1;1,-1,1]'
  lut_colores=[255,0,0;
                    255,128,0;
                    255,255,0;
                    128,255,0;
                    0,255,0;
                    0,255,128;
                    0,255,255;
                    0,128,255;
                    0,0,255]';
  % se calcula la magnitud de los vectores de referencia
  %mag_ref=vecnorm(lut_vector_referencia)
  [ren,col]=size(ca)
  impakal_color=zeros(ren,col,3);
  % se reacomodan en un vector

  can=reshape(ca,[1,ren*col]);
  cbn=reshape(cb,[1,ren*col]);
  ccn=reshape(cc,[1,ren*col]);
  % se juntan en una sola matriz
  pakal_vector=[can;cbn;ccn];
  %size(pakal_vector)
  % se calcula la magnitud de cada vector que describe la region
  mag_pakal=vecnorm(pakal_vector);
  punto=zeros(9,ren*col);
  producto_norma=zeros(1,ren*col);
  cosalpha=zeros(9,ren*col);
  for i=1:9
    % se hacen múltiples copias de un vector de referencia
    vec_ref=repmat(lut_vector_referencia(:,i),1,col*ren);
    mag_ref=vecnorm(vec_ref);
    producto_norma(:)=mag_ref.*mag_pakal;
    %size(vec_ref)
    %size(producto_norma)
    % se realiza el producto punto de pakal con un vector de referencia
    punto(i,:)=dot(pakal_vector,vec_ref);
    cosalpha(i,:)=punto(i,:)./producto_norma;
   endfor
   % se normalizan los valores para obtener reales y se obtiene el coseno inverso
   alpha=acos(rescale(cosalpha));
  [min,index]=min(alpha);
  % se obtiene el pakal a colores
  pakal_color(1,:)=lut_colores(1,index(:));
  pakal_color(2,:)=lut_colores(2,index(:));
  pakal_color(3,:)=lut_colores(3,index(:));
  impakal_color(:,:,1)=uint8(reshape(pakal_color(1,:),[ren,col]));
  impakal_color(:,:,2)=uint8(reshape(pakal_color(2,:),[ren,col]));
  impakal_color(:,:,3)=uint8(reshape(pakal_color(3,:),[ren,col]));
  % se reescalan para ampliar el rango de visaulizacion
  impakal=rescale(index,0,255);
  impakal_gray=uint8(reshape(impakal,[ren,col]));

