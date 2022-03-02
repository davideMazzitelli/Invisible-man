clear;
close all;

names_skin = createdata("names_skin.txt");

imTmp = (imread("35_skin/skin-1-1.jpg"));
imTmp=rgb2hsv(imTmp);
[righe, colonne, ch] = size(imTmp);
imTmp = reshape(imTmp,righe*colonne, 3);
train_values = imTmp;

for j = 2:(1118*3)
    im = (imread("35_skin/"+names_skin{j}));
    im=rgb2hsv(im);
    [righe, colonne, ch] = size(im);
    im = reshape(im,righe*colonne, 3);
    train_values = [train_values; im];
end

m = mean(train_values); % media per colore

s = std(double(train_values)); %deviaz standard