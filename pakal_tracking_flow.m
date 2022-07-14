function impakal_flow=pakal_tracking_flow(cf1,cf2,ws)
  % calcula el flujo optico entre dos imágenes de pakal
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
  [ren,col,com]=size(cf1);
  vec_packalf1=zeros(3,1);
  vec_packalf2=zeros(3,1);
  impakal_flow=zeros(ren,col,3);
  for i=ws+1:ren-ws
    for j=ws+1:col-ws
      smin=360.0;
      index=0;
      vec_packalf1(1,1)=cf1(i,j,1);
      vec_packalf1(2,1)=cf1(i,j,2);
      vec_packalf1(3,1)=cf1(i,j,3);
      nf1=norm(vec_packalf1);
      for sx=-ws:ws
        for sy=-ws:ws
          index=index+1;
          vec_packalf2(1,1)=cf1(i+sx,j+sy,1);
          vec_packalf2(2,1)=cf1(i+sx,j+sy,2);
          vec_packalf2(3,1)=cf1(i+sx,j+sy,3);
          nf2=norm(vec_packalf2);
          prod_cruz=dot(vec_packalf1,vec_packalf2);
          similitud=acos(rescale(prod_cruz/(nf1*nf2)));
          if similitud<smin
            smin=similitud;
            fmin=index;
          endif
        endfor
      endfor
      impakal_flow(i,j,:)=lut_colores(:,fmin);
    endfor
  endfor

