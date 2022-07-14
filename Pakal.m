
imL = double(imread('imL.png'));
imR = double(imread('imR.png'));

% imL = double(rgb2gray(imread('imL.png')));
% imR = double(rgb2gray(imread('imR.png'))); 

[f, c] = size(imL);
dMAX = 16; % COLOCAR DISPARIDAD MAXIMA
winSize = [2];%, 4, 5];
mulWin = length(winSize);

pakali = zeros(f, c);
pakald = zeros(f, c);

paki = zeros(f, c);
pakd = zeros(f, c);

11
[pakd, pakald] = SPHirschmullerD( dMAX, winSize, f, c, imL, imR);
22
[paki,pakali]  = SPHirschmullerI( dMAX, winSize, f, c, imL, imR);
33

DMap1=paki;
DMap2=pakd;

DMapH1=pakali;
DMapH2=pakald;

%% FASE 2 - Izquierda - Derecha
Pak=zeros (f, c);
for v =1:mulWin  
        Pak(:, :) = coLR( DMap2(:, :), DMap1(:, :), c, f, dMAX);
        figure, imshow(uint8(Pak(:, :)*(255/dMAX)));
end

PakHirsh=zeros (f, c);
for v =1:mulWin  
        PakHirsh(:, :) = coLR( DMapH2(:, :), DMapH1(:, :), c, f, dMAX);
        figure, imshow(uint8(PakHirsh(:, :)*(255/dMAX)));
end


