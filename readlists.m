function [list_ori, list_gt]=readlists()
  f=fopen('ori.txt');
  z = textscan(f,'%s');
  fclose(f);
  list_ori = z{:};

  f=fopen('gt.txt');
  z = textscan(f,'%s');
  fclose(f);
  list_gt = z{:};
end
