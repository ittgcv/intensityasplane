function colorpakal=codepakal(vectornormal)
  % codifica con colores falsos la direccion del vector normal, solo del cuadrante norte
  % lut_vector_referencia=[cuadrante,i,j,k]
  lut_vector_referencia=[0,0,0,1;
                                    1,1,0,1;
                                    1,1,1,1;
                                    1,0,1,1;
                                    2,-1,1,1;
                                    2,-1,0,1;
                                    3,-1,-1,1;
                                    3,0,-1,1;
                                    4,1,-1,1];
  lut_colores=[255,0,0;
                    255,128,0;
                    255,255,0;
                    128,255,0;
                    0,255,0;
                    0,255,128;
                    0,255,255;
                    0,128,255;
                    0,0,255];
  amax=180;
  %colorpakal=0;
  colorpakal=[0,0,0];
  for i=1:9
    vectorreferencia=lut_vector_referencia(i,2:4);
    [a]=ab2v(vectornormal,vectorreferencia);    % calcula el angulo entre dos vectores y lo devuelve en a(7)
    if a<amax
      amax=a;
      colorpakal=lut_colores(i,:);
      %colorpakal=i;
    end
  end
  %colorpakal