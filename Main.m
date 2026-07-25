clear;
clc;
close all;

TrainDatabasePath='TrainDatabase';
TestDatabasePath='TestDatabase';

[Eigenfaces,m,A,ProjectedImages]=EigenfaceCore();

TestFiles=dir(fullfile(TestDatabasePath,'*.jpg'));
Test_Number=length(TestFiles);

for i=1:Test_Number

    TestImage=fullfile(TestDatabasePath,[num2str(i) '.jpg']);

    OutputName=Recognition(TestImage,m,A,Eigenfaces);

    MatchedImage=fullfile(TrainDatabasePath,[OutputName '.jpg']);

    figure(1);
    clf;
    set(gcf,'Name',['Test Image ' num2str(i)]);

    subplot(1,2,1)
    imshow(imread(TestImage))
    title(['Test Image ' num2str(i)])

    subplot(1,2,2)
    imshow(imread(MatchedImage))
    title(['Matched Training Image ' OutputName])

    fprintf('Test Image %d matched with Training Image %s\n',i,OutputName);

    pause(1);
end
