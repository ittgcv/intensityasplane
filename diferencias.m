% clear all; close all; clc;
% 
% load FINAL

gtL = double(imread('gtL.png'));
gtL=gtL/16;
%gtL = imread('gtL1.png');
%dmaxi=max(max(gtL))
dmax=16;
%imdis2=imdis;
%figure, imshow(imdis2);
%c=col;
%f=ren;
%gtL=gtL/8;

Diferencia0= zeros(f, c);
Diferencia1= zeros(f, c);
Diferencia2= zeros(f, c);
Diferencia4= zeros(f, c);
Diferencia8= zeros(f, c);
Diferencia12= zeros(f, c);
acierto=0;
errores=0;
%compLR=dLR(:, :, 6);%
%compLR=uint8(disparityLeftRight*77);
%compLR=(Rstdo-1);
compLR=(Pak);
%winSize=vSize;
%ini=max(winSize)+1;
winSize=3;
ini=max(winSize)+1;
dMAX=dmax;
for i =ini:f-ini
    for j=ini:c-dMAX
        if (compLR(i,j) == gtL(i,j))
             Diferencia0 (i,j)= 255;
             acierto=acierto+1;
        else
            Diferencia0(i,j) = 0;
            errores=errores+1;
        end
    end
end
total0=(acierto*100)/(acierto+errores)


acierto=0;
errores=0;
ini=max(winSize)+1;
for i =ini:f-ini
    for j=ini:c-dMAX
        if (compLR(i,j) == gtL(i,j) || compLR(i,j) +1 == gtL(i,j) || compLR(i,j) -1 == gtL(i,j))
             Diferencia1 (i,j)= 255;
             acierto=acierto+1;
        else
            Diferencia1(i,j) = 0;
            errores=errores+1;
        end
    end
end
total1=(acierto*100)/(acierto+errores)


acierto=0;
errores=0;
ini=max(winSize)+1;
for i =ini:f-ini
    for j=ini:c-dMAX
        if (compLR(i,j) == gtL(i,j) || compLR(i,j) +2 == gtL(i,j) || compLR(i,j) -2 == gtL(i,j) || compLR(i,j) +1 == gtL(i,j) || compLR(i,j) -1 == gtL(i,j))
             Diferencia2 (i,j)= 255;
             acierto=acierto+1;
        else
            Diferencia2(i,j) = 0;
            errores=errores+1;
        end
    end
end
total2=(acierto*100)/(acierto+errores)

acierto=0;
errores=0;
ini=max(winSize)+1;
for i =ini:f-ini
    for j=ini:c-dMAX
        if compLR(i,j) == gtL(i,j)||compLR(i,j) +4 == gtL(i,j) || compLR(i,j) -4 == gtL(i,j)||compLR(i,j) +3 == gtL(i,j) || compLR(i,j) -3 == gtL(i,j) ||  compLR(i,j) +2 == gtL(i,j) || compLR(i,j) -2 == gtL(i,j) || compLR(i,j) +1 == gtL(i,j) || compLR(i,j) -1 == gtL(i,j)
             Diferencia4 (i,j)= 255;
             acierto=acierto+1;
        else
            Diferencia4(i,j) = 0;
            errores=errores+1;
        end
    end
end
total4=(acierto*100)/(acierto+errores)



acierto=0;
errores=0;
ini=max(winSize)+1;
for i =ini:f-ini
    for j=ini:c-dMAX
        if (compLR(i,j) == gtL(i,j) ||compLR(i,j) +8 == gtL(i,j) || compLR(i,j) -8 == gtL(i,j)||compLR(i,j) +7 == gtL(i,j) || compLR(i,j) -7 == gtL(i,j)||compLR(i,j) +6 == gtL(i,j) || compLR(i,j) -6 == gtL(i,j)||compLR(i,j) +5 == gtL(i,j) || compLR(i,j) -5 == gtL(i,j)||compLR(i,j) +4 == gtL(i,j) || compLR(i,j) -4 == gtL(i,j)||compLR(i,j) +3 == gtL(i,j) || compLR(i,j) -3 == gtL(i,j) ||  compLR(i,j) +2 == gtL(i,j) || compLR(i,j) -2 == gtL(i,j) || compLR(i,j) +1 == gtL(i,j) || compLR(i,j) -1 == gtL(i,j))
             Diferencia8 (i,j)= 255;
             acierto=acierto+1;
        else
            Diferencia8(i,j) = 0;
            errores=errores+1;
        end
    end
end
total8=(acierto*100)/(acierto+errores)

acierto=0;
errores=0;
ini=max(winSize)+1;
for i =ini:f-ini
    for j=ini:c-dMAX
        if (compLR(i,j) == gtL(i,j) ||compLR(i,j) +12 == gtL(i,j) || compLR(i,j) -12 == gtL(i,j) ||compLR(i,j) +11 == gtL(i,j) || compLR(i,j) -11 == gtL(i,j) ||compLR(i,j) +10 == gtL(i,j) || compLR(i,j) -10 == gtL(i,j) ||compLR(i,j) +9 == gtL(i,j) || compLR(i,j) -9 == gtL(i,j) ||compLR(i,j) +8 == gtL(i,j) || compLR(i,j) -8 == gtL(i,j)||compLR(i,j) +7 == gtL(i,j) || compLR(i,j) -7 == gtL(i,j)||compLR(i,j) +6 == gtL(i,j) || compLR(i,j) -6 == gtL(i,j)||compLR(i,j) +5 == gtL(i,j) || compLR(i,j) -5 == gtL(i,j)||compLR(i,j) +4 == gtL(i,j) || compLR(i,j) -4 == gtL(i,j)||compLR(i,j) +3 == gtL(i,j) || compLR(i,j) -3 == gtL(i,j) ||  compLR(i,j) +2 == gtL(i,j) || compLR(i,j) -2 == gtL(i,j) || compLR(i,j) +1 == gtL(i,j) || compLR(i,j) -1 == gtL(i,j))
             Diferencia12 (i,j)= 255;
             acierto=acierto+1;
        else
            Diferencia12(i,j) = 0;
            errores=errores+1;
        end
    end
end
total12=(acierto*100)/(acierto+errores)
%figure(); imshow(FINAL);
figure(); imshow(Diferencia0);
figure(); imshow(Diferencia1);
figure(); imshow(Diferencia2);
figure(); imshow(Diferencia4);
figure(); imshow(Diferencia8);
figure(); imshow(Diferencia12);
