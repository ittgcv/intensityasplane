iml=imread('imcl.png');
imr=imread('imcr.png');
renglon=128;
rl=iml(renglon-1:renglon+1,1:30)
rr=imr(renglon-1:renglon+1,1:30)
imdisparity=sadreduced(rl,rr,16,1)
imshow(uint8(imdisparity))