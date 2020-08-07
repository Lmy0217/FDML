clc
clear all

fileFolder = fullfile('./VIPeR/cam_a');
dirOutput = dir(fullfile(fileFolder, '*'));
fileNames = {dirOutput.name}';

adata = zeros(632, 3, 128, 64);
for i = 1 : size(adata, 1)
    im = imread(['./VIPeR/cam_a/', fileNames{i + 2, 1}]);
    im = imresize(im, [64, 128]);
    adata(i, :, :, :) = permute(im, [3, 2, 1]);
end

fileFolder = fullfile('./VIPeR/cam_b');
dirOutput = dir(fullfile(fileFolder, '*'));
fileNames = {dirOutput.name}';

bdata = zeros(632, 3, 128, 64);
for i = 1 : size(bdata, 1)
    im = imread(['./VIPeR/cam_b/', fileNames{i + 2, 1}]);
    im = imresize(im, [64, 128]);
    bdata(i, :, :, :) = permute(im, [3, 2, 1]);
end

save('./VIPeR/a.mat', 'adata');
save('./VIPeR/b.mat', 'bdata');