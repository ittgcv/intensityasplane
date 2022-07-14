imagen=imread('tsukuba_left.png');
[ca,cb,cc,pakal_image,pakal_color]=pakal_convolution(imagen);
imshow(pakal_image);
figure, imshow(pakal_color);
im_reduced=imresize(imagen,0.5);
[ca,cb,cc,pakal_gray,pakal_color_r]=pakal_convolution(im_reduced);
figure, imshow(pakal_gray);
figure, imshow(pakal_color_r);

