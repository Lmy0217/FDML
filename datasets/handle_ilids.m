clc
clear all

fileFolder = fullfile('./i-LIDS/Persons');
dirOutput = dir(fullfile(fileFolder, '*.jpg'));
fileNames = {dirOutput.name}';

data = zeros(size(fileNames, 1), 3, 128, 64);
label = zeros(size(fileNames, 1), 1);
for index = 1 : size(fileNames, 1)
        idi = fileNames{index, 1};
        idi = str2double(idi(1 : 4));
        im = imread(['./i-LIDS/Persons/', fileNames{index, 1}]);
        im = imresize(im, [128, 64]);
        data(index, :, :, :) = permute(im, [3, 1, 2]);
        label(index, 1) = idi;
end

save('./i-LIDS/datas.mat', 'data');
save('./i-LIDS/labels.mat', 'label');