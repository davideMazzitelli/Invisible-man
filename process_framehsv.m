function outImage = process_framehsv(image, m, s, k, background)


%applicazione filtro mediano 3x3
image(:,:,1) = medfilt2(image(:,:,1));
image(:,:,2) = medfilt2(image(:,:,2));
image(:,:,3) = medfilt2(image(:,:,3));
f5 = fspecial('average',3);
image(:,:,1) =imfilter(image(:,:,1),f5);
image(:,:,2) =imfilter(image(:,:,2),f5);
image(:,:,3) =imfilter(image(:,:,3),f5);

imagehsv=rgb2hsv(image);

mask_h = (imagehsv(:,:,1) >= m(1) - k*s(1)) & (imagehsv(:,:,1) <= m(1) + k*s(1));
mask_s = (imagehsv(:,:,2) >= m(2) - 2*k*s(2)) ;


predicted = mask_h & mask_s ;

s = strel('disk', 17);
predicted=imclose(predicted,s);

imageTmp = image - (255*uint8(predicted)); 

outImage = imageTmp + (uint8(predicted).* background);



end