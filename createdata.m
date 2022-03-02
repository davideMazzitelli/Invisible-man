function [images] = createdata(fileName)

  f=fopen(fileName);
  z = textscan(f,'%s');
  fclose(f);
  images = z{:};

end