function T = CreateDatabase()

TrainDatabasePath = 'TrainDatabase';

imgFiles = dir(fullfile(TrainDatabasePath, '*.jpg'));
% Sort files numerically instead of alphabetically
names = {imgFiles.name};
numbers = cellfun(@(x) sscanf(x,'%d.jpg'), names);
[~,idx] = sort(numbers);
imgFiles = imgFiles(idx);

if isempty(imgFiles)
    imgFiles = dir(fullfile(TrainDatabasePath, '*.png'));
end

if isempty(imgFiles)
    imgFiles = dir(fullfile(TrainDatabasePath, '*.bmp'));
end

numImages = length(imgFiles);

if numImages == 0
    error('No images found in TrainDatabase folder.');
end

sample = imread(fullfile(TrainDatabasePath, imgFiles(1).name));

if size(sample,3)==3
    sample = rgb2gray(sample);
end

sample = imresize(sample,[112 92]);

[m,n] = size(sample);

T = zeros(m*n,numImages);

for i = 1:numImages

    img = imread(fullfile(TrainDatabasePath,imgFiles(i).name));

    if size(img,3)==3
        img = rgb2gray(img);
    end

    img = imresize(img,[112 92]);

    T(:,i) = double(img(:));

end

end
