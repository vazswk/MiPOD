% This example demonstrates how to use the MiPOD embedding function
clc
clear all
close all

% Read the input cover image
Cover = double(imread ('1013.pgm'));

% Set the payload to 0.2 bpp
Payload = 0.15;

% MiPOD embedding
tStart = tic;
[Stego, pChange, ChangeRate] = MiPOD( Cover, Payload );
tEnd = toc(tStart);
D_no_filter = Cover - double(Stego);
D_no_filter(D_no_filter(:)>=2) = 1;
D_no_filter(D_no_filter(:)<=-2) = -1;
show_cost_dis(D_no_filter)
save('MiPOD_no_filter.mat','D_no_filter')
       
fprintf('MiPOD embedding is done in: %f (sec)\n',tEnd);

%%
close all

figure;
imshow (Cover,[]);
title ('Cover image');

figure;
imshow(1-pChange/0.3333);
title('MiPOD - Embedding Change Probabilities');

figure;
imshow(Stego-Cover,[]);
title('MiPOD - Changed Pixels (+1 -> white ,-1 -> black)');