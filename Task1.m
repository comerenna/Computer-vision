%%
% One Model with the same parameter settings for all the images
clc; 
clear;
basefolder = 'C:\Users\Computing\Documents\skin lesion dataset';
segmentation = 'C:\Users\Computing\Documents\skin lesion dataset\segmentation';

imagefiles = dir('C:\Users\Computing\Downloads\skin lesion dataset\org data\*.jpg');
groundtruthfiles = dir('C:\Users\Computing\Downloads\skin lesion dataset\GT\*.png');


dice_similarity_score=zeros(1,60);

nfiles = length(imagefiles)
 for i=1:nfiles
     currentfilename =['C:\Users\Computing\Downloads\skin lesion dataset\org data\', imagefiles(i).name];
     currentimage = imread(currentfilename);
     I_gray=rgb2gray(currentimage);
     %imshow(I_gray)
     I_gray = imbinarize(I_gray);
     I_gray = imclose(I_gray, strel('disk',10));
    
    % complement result to get DS score
      I_gray = imcomplement(I_gray);
     
     groundtruthfilename =['C:\Users\Computing\Downloads\skin lesion dataset\GT\', groundtruthfiles(i).name];
     currentgroundtruthimage = imread(groundtruthfilename);
     currentgroundtruthimage = imbinarize(currentgroundtruthimage);
     
     
     dice_similarity_score(i) = dice(I_gray,currentgroundtruthimage);
     
     
     cd(segmentation)
     imwrite(I_gray,imagefiles(i).name);
     cd(basefolder)
     %images{i} = currentimage;
%      i= i+1
 end
 %% 
 
dmean = mean(dice_similarity_score)
stddd = std(dice_similarity_score)

dice_similarity_score


BW1 = segmented images
BW2 = GT
similarity = dice(BW1,BW2)

%% 

file_names = dir('C:\Users\Computing\Downloads\skin lesion dataset\org data\');
file_names = file_names(~[file_names.isdir]);
file_names = {file_names.name}


file_names1 = categorical(file_names);
dice_similarity_score1 = categorical(dice_similarity_score)
bar(file_names1,dice_similarity_score)
     