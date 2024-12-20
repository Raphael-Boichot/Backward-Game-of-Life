%used in:
%https://github.com/Raphael-Boichot/Progressive-evolutionary-structural-optimisation-algorithm
clc
clear
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%User parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
target_directory='Figure/';           %source directory to process
target_mp4_file='Images/Topology.mp4';       %target file for mp4, keep all image
target_gif_file='Images/Topology.gif';       %target file for animated gif
target_starting_file='Best_start.png' %source file for animation
target_game_evolution='Images/Animation.gif' %source file for animation
epoch_number = 25;                    %number of epoch to consider in animation
gif_deadtime=0.1;                     %delay is seconds between pictures for animated gifs
gif_skip=2;                           %keep every 1 out of gif_skip image for gif
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

try
    rmdir('Images','s');
catch
    disp('Folder not present')
end
mkdir('Images');

imwrite(imresize(imread('Best_end.png'),8,'nearest'), './Images/Best_end.png')
imwrite(imresize(imread('Best_start.png'),8,'nearest'), './Images/Best_start.png')
imwrite(imresize(imread('Target.png'),8,'nearest'), './Images/Target.png')

vidfile = VideoWriter(target_mp4_file,'MPEG-4');
open(vidfile);
listing = dir([target_directory,'*.png']);
for i=1:1:length(listing)
    name=[target_directory,listing(i).name];
    disp(['Processing ',target_directory,listing(i).name]);
    frame=imread(name);
    %[height, width, null]=size(frame);
    %frame=imresize(frame,[800 800],'nearest');
    writeVideo(vidfile, frame);
    [imind,map] = rgb2ind(cat(3,frame),256);
    if i==1
        imwrite(imind,map,target_gif_file,'gif', 'Loopcount',inf,'DelayTime',gif_deadtime);
    else
        if rem(i,gif_skip)==0
            imwrite(imind,map,target_gif_file,'gif','WriteMode','append','DelayTime',gif_deadtime);
        end
    end
end
close(vidfile)

target=imread('Best_start.png');
colors=unique(target);
space_after=(target==colors(1))*0+(target==colors(2))*1;
[height,width]=size(space_after);
DNA=reshape(space_after,1,[]);
frame=cat(3,target,target,target);
[imind,map] = rgb2ind(cat(3,imresize(frame,8,'nearest')),256);
imwrite(imind,map,target_game_evolution,'gif', 'Loopcount',inf,'DelayTime',gif_deadtime);

for i=1:1:epoch_number*2
    [space_after]=game_of_life(DNA, i, height,width);
    space_after=(space_after==0)*0+(space_after==1)*255;
    frame=cat(3,space_after,space_after,space_after);
    [imind,map] = rgb2ind(cat(3,imresize(frame,8,'nearest')),256);
    imwrite(imind,map,target_game_evolution,'gif','WriteMode','append','DelayTime',gif_deadtime);
end
disp('End of conversion, enjoy your fancy animations !')

