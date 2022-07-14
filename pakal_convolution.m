function [coeff_a,coeff_b,coeff_c,imgray,imcolor]=pakal_convolution(imagen)
  %ma=[-1/6,-1/6,-1/6;0,0,0;1/6,1/6,1/6]
  %mb=[-1/6,0,1/6;-1/6,0,1/6;-1/6,0,1/6]
  %mc=[1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9]
  [ma,mb,mc]=pakal_kernel(3);
  tic
  coeff_a=conv2(imagen,ma);
  coeff_b=conv2(imagen,mb);
  coeff_c=conv2(imagen,mc);
  toc
  [imgray,imcolor]=pakal_convolution_code_efficient(coeff_a,coeff_b,coeff_c);
  %imshow(uint8(imgray));
  %figure, imshow(uint8(imcolor));

