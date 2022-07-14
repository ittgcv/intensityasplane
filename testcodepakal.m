function testcodepakal()
  lut_vector_referencia=[0,0,0,1;1,1,0,1;1,1,1,1;1,0,1,1;2,-1,1,1;2,-1,0,1;3,-1,-1,1;3,0,-1,1;4,1,-1,1]*10;
  for i=1:9
    imagen(1,i,:)=codepakal(lut_vector_referencia(i,2:4));
  end
  imshow(uint8(imagen));
  