function outImage = process_predicted(image, k, m, s)


%applicazione filtro mediano
image(:,:,1) = medfilt2(image(:,:,1));
image(:,:,2) = medfilt2(image(:,:,2));
image(:,:,3) = medfilt2(image(:,:,3));
f = fspecial('average',3);
image(:,:,1) =imfilter(image(:,:,1),f);
image(:,:,2) =imfilter(image(:,:,2),f);
image(:,:,3) =imfilter(image(:,:,3),f);

imagehsv=rgb2hsv(image);

mask_h = (imagehsv(:,:,1) >= m(1) - k*s(1)) & (imagehsv(:,:,1) <= m(1) + k*s(1));
mask_s = (imagehsv(:,:,2) >= m(2) - 2*k*s(2)) ;


predicted = mask_h & mask_s ;

s = strel('disk', 17);
outImage=imclose(predicted,s);

end