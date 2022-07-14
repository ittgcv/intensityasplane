function [coeff,imcolor]=pakal_tracking_transform(imagen,window_size)
  %ma=[-1/6,-1/6,-1/6;0,0,0;1/6,1/6,1/6];
  %mb=[-1/6,0,1/6;-1/6,0,1/6;-1/6,0,1/6];
  %mc=[1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9];
  [ma,mb,mc]=pakal_kernel(window_size);
  tic
  coeff=conv2(imagen,ma);
  coeff(:,:,2)=conv2(imagen,mb);
  coeff(:,:,3)=conv2(imagen,mc);
  toc
  [imgray,imcolor]=pakal_convolution_code_efficient(coeff(:,:,1),coeff(:,:,2),coeff(:,:,3));

