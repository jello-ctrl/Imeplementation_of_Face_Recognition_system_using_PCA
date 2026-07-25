function OutputName = Recognition(TestImage, m, A, Eigenfaces)
% Recognition using PCA (Eigenfaces)

% Project all training images
ProjectedImages = Eigenfaces' * A;
Train_Number = size(ProjectedImages,2);

% Read the test image
InputImage = imread(TestImage);

% Convert to grayscale if needed
if size(InputImage,3) == 3
    InputImage = rgb2gray(InputImage);
end

% Resize to the same size as training images
InputImage = imresize(InputImage,[112 92]);

% Convert image into a column vector
InImage = double(InputImage(:));

% Normalize using the mean face
Difference = InImage - m;

% Project test image into eigenface space
ProjectedTestImage = Eigenfaces' * Difference;

% Compute Euclidean distances
Euc_dist = zeros(1,Train_Number);

for i = 1:Train_Number
    Euc_dist(i) = norm(ProjectedTestImage - ProjectedImages(:,i));
end

% Find the closest match
[minDist, Recognized_index] = min(Euc_dist);

fprintf('Minimum Distance = %.2f\n', minDist);

OutputName = num2str(Recognized_index);

end
