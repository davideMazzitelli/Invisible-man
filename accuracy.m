clear;
close all;

load("meanhsv.mat");
load("stdhsv.mat");
k=1.5;
[list_ori, list_gt] = readlists();
accuracy_tot = 0;
TP_tot = 0;
FP_tot=0;
FN_tot=0;
for i = 1 : 1118
    im_ori = imread(list_ori{i});
    im_gt = imread(list_gt{i});

    im_gt = rgb2gray(im_gt);
    im_gt = im2bw(im_gt,0.2);

    im_ori = process_predicted(im_ori, k, m, s);

    results = confmat(im_gt, im_ori);
    
    accuracy_tot = accuracy_tot + results.accuracy;
    TP_tot=TP_tot + results.cm(2,2);
    FP_tot=FP_tot + results.cm(1,2);
    FN_tot = FN_tot + results.cm(2,1);  
end
Mean_accuracy = accuracy_tot/1118
TP_mean=TP_tot/1118
FP_mean = FP_tot/1118
FN_mean = FN_tot/1118
