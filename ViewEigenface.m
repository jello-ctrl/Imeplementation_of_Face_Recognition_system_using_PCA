clear;
clc;

[Eigenfaces, MeanFace, ProjectedImages] = EigenfaceCore();

figure;

for i = 1:9
    subplot(3,3,i);
    img = reshape(Eigenfaces(:,i),[112 92]);
    imshow(mat2gray(img));
    title(['Eigenface ' num2str(i)]);
end
