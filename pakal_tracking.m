imf1=(imresize((imread('tsukuba_left.png')),.5));
imf2=(imresize((imread('tsukuba_right.png')),.5));
window_size=3
% calcula la transformada de pakal
[impakalf1,colorf1]=pakal_tracking_transform(imf1,window_size);
[impakalf2,colorf2]=pakal_tracking_transform(imf2,window_size);
%impakalflow=pakal_tracking_flow(impakalf1,impakalf2,1);
figure, subplot(2,1,1) ,imshow(colorf1);
subplot(2,1,2), imshow(colorf2);
figure,imshow(uint8(impakalflow));
