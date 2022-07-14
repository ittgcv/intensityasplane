function compare_pakal()
  # compara el pakal con ciclos y el pakal con kernel
  imagen=imread('tsukubal.png');
  #[imp,imn,imcp]=pakaltransform(imagen,ws);
  #save pakaldata
  load pakaldata;
  ws=5
  #subplot(1,3,1), imhist(imp(:,:,1));
  #subplot(1,3,2), imhist(imp(:,:,2));
  #subplot(1,3,3), imhist(imp(:,:,3));
  imshow(imcp);
  tic
  [ma,mb,mc]=pakal_kernel(2*ws+1);
  coeff=conv2(imagen,ma);
  #figure, subplot(1,3,1), imhist(coeff);
  coeff(:,:,2)=conv2(imagen,mb);
  #subplot(1,3,2),imhist(coeff(:,:,2));
  coeff(:,:,3)=conv2(imagen,mc);
  #subplot(1,3,3),imhist(coeff(:,:,3));
  [imcg,imcc]=pakal_convolution_code_efficient(coeff(:,:,1),coeff(:,:,2),coeff(:,:,3));
  toc
  figure, imshow(imcc);
endfunction
compare_pakal