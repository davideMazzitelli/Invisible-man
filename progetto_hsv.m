close all;
clear;


vid = VideoReader('video_da_processare.mp4');

if hasFrame(vid)
    background = readFrame(vid);    
end

%applicazione filtro mediano 3x3
background(:,:,1) = medfilt2(background(:,:,1));
background(:,:,2) = medfilt2(background(:,:,2));
background(:,:,3) = medfilt2(background(:,:,3));

video_out = VideoWriter('video_out.avi');
video_out.FrameRate=30;
open(video_out);

load("meanhsv.mat");
load("stdhsv.mat");
k=1.5;

while hasFrame(vid)

    frame = readFrame(vid);
    
    frame = process_framehsv(frame, m, s, k, background);

    writeVideo(video_out,frame);
   
end

close(video_out);

delete(vid);