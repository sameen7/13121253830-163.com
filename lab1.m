Irooster = im2double(imread('../rooster.jpg'));
Iwoods = imread('../woods.png');
Ielephant = imread('../elephant.png');
Iboxes = imread('../boxes.pgm');

IDrooster = im2double(rgb2gray(Irooster));
IDwoods = im2double(Iwoods);
IDelephant = im2double(Ielephant);
IDboxes = im2double(Iboxes);

% -------------------- task 3.1.1 --------------------
box5_mask = fspecial('average', 5);
box25_mask = fspecial('average', 25);

rooster5_conv = conv2(IDrooster, box5_mask, 'same');
rooster25_conv = conv2(IDrooster, box25_mask, 'same');
boxes5_conv = conv2(IDboxes, box5_mask, 'same');
boxes25_conv = conv2(IDboxes, box25_mask, 'same');

% figure('name', '3.1.1'), subplot(2, 2, 1), imagesc(rooster5_conv); title("5X5 box mask--rooster"); colorbar;
% subplot(2, 2, 2), imagesc(rooster25_conv); title("25X25 box mask--rooster"); colorbar;
% subplot(2, 2, 3), imagesc(boxes5_conv); title("5X5 box mask--boxes"); colorbar;
% subplot(2, 2, 4), imagesc(boxes25_conv); title("25X25 box mask--boxes"); colorbar;
% colormap('gray');

% -------------------- task 3.2.1 --------------------
Gaussian_mask1 = fspecial('gaussian', 10, 1.5);
Gaussian_mask2 = fspecial('gaussian', 70, 10);

roosterG1_conv = conv2(IDrooster, Gaussian_mask1, 'same');
roosterG2_conv = conv2(IDrooster, Gaussian_mask2, 'same');
boxesG1_conv = conv2(IDboxes, Gaussian_mask1, 'same');
boxesG2_conv = conv2(IDboxes, Gaussian_mask2, 'same');

% figure('name', '3.2.1'), subplot(2, 2, 1), imagesc(roosterG1_conv); title("gaussian1.5 mask--rooster"); colorbar;
% subplot(2, 2, 2), imagesc(roosterG2_conv); title("gaussian10 mask--rooster"); colorbar;
% subplot(2, 2, 3), imagesc(boxesG1_conv); title("gaussian1.5 mask--boxes"); colorbar;
% subplot(2, 2, 4), imagesc(boxesG2_conv); title("gaussian10 mask--boxes"); colorbar;
% colormap('gray');

% -------------------- task 3.3 nomarks --------------------
Gaussian_mask3 = fspecial('gaussian', [1, 60], 10);
temp = conv2(IDrooster, Gaussian_mask3, 'full');
roosterG3_conv = conv2(temp, Gaussian_mask3.', 'full');

% figure('name', '3.3'), subplot(1, 1, 1), imagesc(roosterG3_conv); title("gaussian10 mask--rooster"); colorbar;
% colormap('gray');

% -------------------- task 4.1.1 --------------------
% y = sin([0:0.01:2*pi]); subplot(3, 1, 1), plot(y);
% yd1 = conv2(y, [-1, 1], 'valid'); subplot(3, 1, 2), plot(yd1);
% yd2 = conv2(y, [-1, 2, -1], 'valid'); subplot(3, 1, 3), plot(yd2);

% -------------------- task 4.2.1 --------------------
t = -ones(3)/8;
t(2, 2) = -t(2, 2) * 8;
Laplacian_mask1 = t;
Laplacian_mask2 = Laplacian_mask1 * 8;

boxesL1_conv = conv2(IDboxes, Laplacian_mask1, 'same');
boxesL2_conv = conv2(IDboxes, Laplacian_mask2, 'same');

% figure('name', '4.2.1'), subplot(2, 2, 1), imagesc(boxesL1_conv); title("laplacian mask1--boxes"); colorbar;
% subplot(2, 2, 2), imagesc(boxesL2_conv); title("laplacian mask2--boxes"); colorbar;
% colormap('gray');

% -------------------- task 4.3 --------------------
Sobel_mask = fspecial('sobel');
Sobel_maskT = Sobel_mask.';
Prewitt_mask = fspecial('prewitt');
Prewitt_maskT = Prewitt_mask.';

boxesS1_conv = conv2(IDboxes, Sobel_mask, 'same');
boxesS2_conv = conv2(IDboxes, Sobel_maskT, 'same');
boxesP1_conv = conv2(IDboxes, Prewitt_mask, 'same');
boxesP2_conv = conv2(IDboxes, Prewitt_maskT, 'same');

% figure('name', '4.3'), subplot(2, 2, 1), imagesc(boxesS1_conv); title("sobel mask--boxes"); colorbar;
% subplot(2, 2, 2), imagesc(boxesS2_conv); title("sobel maskT--boxes"); colorbar;
% subplot(2, 2, 3), imagesc(boxesP1_conv); title("prewitt mask--boxes"); colorbar;
% subplot(2, 2, 4), imagesc(boxesP2_conv); title("prewitt maskT--boxes"); colorbar;
% colormap('jet');

% -------------------- task 5.1.1/5.1.2 --------------------
gaussian_temp = fspecial('gaussian', 15, 1.5);
gaussian_temp2 = fspecial('gaussian', 35, 5);
Gaussian_X = conv2(gaussian_temp, [-1, 1], 'same');
Gaussian_Y = conv2(gaussian_temp, [-1, 1].', 'same');

boxesGX_conv = conv2(IDboxes, Gaussian_X, 'same');
boxesGY_conv = conv2(IDboxes, Gaussian_Y, 'same');

% figure('name', '5.1.1'), subplot(2, 2, 1), mesh(Gaussian_X); title("x"); colorbar;
% subplot(2, 2, 2), mesh(Gaussian_Y); title("y"); colorbar;
% subplot(2, 2, 3), imagesc(boxesGX_conv); title("Gaussian_X"); colorbar;
% subplot(2, 2, 4), imagesc(boxesGY_conv); title("Gaussian_Y"); colorbar;
% colormap('jet');

% [aaX, aaY] = gradient(boxesGX_conv);
% [bbX, bbY] = gradient(boxesGY_conv);
% v1X = max(max(aaX));
% v1Y = max(max(aaY))
% [row1X, col1X] = find(v1X == aaX);
% [row1Y, col1Y] = find(v1Y == aaY);
% v2X = max(max(bbX));
% v2Y = max(max(bbY));
% [row2X, col2X] = find(v2X == bbX);
% [row2Y, col2Y] = find(v2Y == bbY);

% -------------------- task 5.1.3 --------------------
roosterGX_conv = conv2(IDrooster, Gaussian_X, 'same');
roosterGY_conv = conv2(IDrooster, Gaussian_Y, 'same');

boxesGM = sqrt(boxesGX_conv.^2 + boxesGY_conv.^2);
roosterGM = sqrt(roosterGX_conv.^2 + roosterGY_conv.^2);

% figure('name', '5.1.3'), subplot(2, 2, 1), imagesc(boxesGM); title("L2-norm--boxes"); colorbar;
% subplot(2, 2, 2), imagesc(roosterGM); title("L2-norm--rooster"); colorbar;
% colormap('gray');

% -------------------- task 5.2.1 --------------------
LoG_mask1 = conv2(gaussian_temp, Laplacian_mask1, 'valid');
LoG_mask2 = conv2(gaussian_temp2, Laplacian_mask1, 'valid');

boxesLoG1_conv = conv2(IDboxes, LoG_mask1, 'same');
boxesLoG2_conv = conv2(IDboxes, LoG_mask2, 'same');

% figure('name', '5.2.1'), subplot(2, 2, 1), mesh(LoG_mask1); title("deviation 1.5"); colorbar;
% subplot(2, 2, 2), mesh(LoG_mask2); title("deviation 5"); colorbar;
% subplot(2, 2, 3), imagesc(boxesLoG1_conv); title("deviation 1.5"); colorbar;
% subplot(2, 2, 4), imagesc(boxesLoG2_conv); title("deviation 5"); colorbar;
% colormap('jet');
% 
% [aaX, aaY] = gradient(boxesLoG1_conv);
% [bbX, bbY] = gradient(boxesLoG2_conv);
% v1X = max(max(aaX));
% v1Y = max(max(aaY))
% [row1X, col1X] = find(v1X == aaX);
% [row1Y, col1Y] = find(v1Y == aaY);
% v2X = max(max(bbX));
% v2Y = max(max(bbY));
% [row2X, col2X] = find(v2X == bbX);
% [row2Y, col2Y] = find(v2Y == bbY);

% -------------------- task 5.2.2 --------------------
roosterLoG1_conv = conv2(IDrooster, LoG_mask1, 'same');
roosterLoG2_conv = conv2(IDrooster, LoG_mask2, 'same');

% figure('name', '5.2.2'), subplot(2, 2, 1), mesh(LoG_mask1); title("deviation 1.5"); colorbar;
% subplot(2, 2, 2), mesh(LoG_mask2); title("deviation 5"); colorbar;
% subplot(2, 2, 3), imagesc(roosterLoG1_conv); title("deviation 1.5"); colorbar;
% subplot(2, 2, 4), imagesc(roosterLoG2_conv); title("deviation 5"); colorbar;
% colormap('gray');

% -------------------- task 5.3.1 --------------------
elephantGabor_conv = conv2(IDelephant, gabor2(4, 8, 90, 0.5, 0), 'valid');
elephantGabor2_conv = conv2(IDelephant, gabor2(4, 8, 90, 0.5, 90), 'valid');
elephantGM = sqrt(elephantGabor_conv.^2 + elephantGabor2_conv.^2);

g1 = gabor2(4, 8, 0, 0.5, 0);
elephantG1_conv = conv2(IDelephant, g1, 'valid');
g2 = gabor2(4, 8, 15, 0.5, 0);
elephantG2_conv = conv2(IDelephant, g2, 'valid');
g3 = gabor2(4, 8, 30, 0.5, 0);
elephantG3_conv = conv2(IDelephant, g3, 'valid');
g4 = gabor2(4, 8, 45, 0.5, 0);
elephantG4_conv = conv2(IDelephant, g4, 'valid');
g5 = gabor2(4, 8, 60, 0.5, 0);
elephantG5_conv = conv2(IDelephant, g5, 'valid');
g6 = gabor2(4, 8, 75, 0.5, 0);
elephantG6_conv = conv2(IDelephant, g6, 'valid');
g7 = gabor2(4, 8, 90, 0.5, 0);
elephantG7_conv = conv2(IDelephant, g7, 'valid');
g8 = gabor2(4, 8, 105, 0.5, 0);
elephantG8_conv = conv2(IDelephant, g8, 'valid');
g9 = gabor2(4, 8, 120, 0.5, 0);
elephantG9_conv = conv2(IDelephant, g9, 'valid');
g10 = gabor2(4, 8, 135, 0.5, 0);
elephantG10_conv = conv2(IDelephant, g10, 'valid');
g11 = gabor2(4, 8, 150, 0.5, 0);
elephantG11_conv = conv2(IDelephant, g11, 'valid');
g12 = gabor2(4, 8, 165, 0.5, 0);
elephantG12_conv = conv2(IDelephant, g12, 'valid');
Ic(57, 57, 12) = 0;
Ic(:, :, 1) = g1;
Ic(:, :, 2) = g2;
Ic(:, :, 3) = g3;
Ic(:, :, 4) = g4;
Ic(:, :, 5) = g5;
Ic(:, :, 6) = g6;
Ic(:, :, 7) = g7;
Ic(:, :, 8) = g8;
Ic(:, :, 9) = g9;
Ic(:, :, 10) = g10;
Ic(:, :, 11) = g11;
Ic(:, :, 12) = g12;
res = max(Ic, [], 3);

% Ic2 = cat(3, elephantG1_conv, elephantG2_conv, elephantG3_conv, elephantG4_conv, elephantG5_conv, elephantG6_conv, elephantG7_conv, elephantG8_conv, elephantG9_conv, elephantG10_conv, elephantG11_conv, elephantG12_conv)
% 
% elephantGabor3_conv = max(Ic2, [], 3);
% 
% figure('name', '5.3.1'), subplot(2, 2, 1), imagesc(elephantGabor_conv); title(""); colorbar;
% subplot(2, 2, 2), imagesc(elephantGM); title(""); colorbar;
% subplot(2, 2, 3), imagesc(elephantGabor3_conv); title(""); colorbar;
% subplot(2, 2, 4), imagesc(res); title(""); colorbar;
% colormap('gray');

% -------------------- task 6.1.1 --------------------
shift = 0:1:30
% for i = shift
%     cc1(i+1) = newcorr2(IDrooster, i);
%     cc2(i+1) = newcorr2(IDwoods, i);    
% end
% figure('name', '6.1.1'), subplot(1, 2, 1), plot(shift, cc1); title("rooster"); xlabel('shift'); ylabel('correlation coefficient');
% subplot(1, 2, 2), plot(shift, cc2); title("woods");  xlabel('shift'); ylabel('correlation coefficient');

% -------------------- task 6.2.1 --------------------
DoG_mask1 = fspecial('gaussian', 42, 2) - fspecial('gaussian', 42, 6);
DoG_mask2 = fspecial('gaussian', 28, 0.5) - fspecial('gaussian', 28, 4);

roosterDoG1_conv = conv2(IDrooster, DoG_mask1, 'same');
roosterDoG2_conv = conv2(IDrooster, DoG_mask2, 'same');
woodsDoG1_conv = conv2(IDwoods, DoG_mask1, 'same');
woodsDoG2_conv = conv2(IDwoods, DoG_mask2, 'same');

% for i = shift
%     cc1(i+1) = newcorr2(roosterDoG1_conv, i);
%     cc2(i+1) = newcorr2(roosterDoG2_conv, i);  
%     cc3(i+1) = newcorr2(woodsDoG1_conv, i);
%     cc4(i+1) = newcorr2(woodsDoG2_conv, i);     
% end

% figure('name', '6.2.1-1'), subplot(2, 2, 1), imagesc(roosterDoG1_conv); title("rooster-deviation2/6"); colorbar;
% subplot(2, 2, 2), imagesc(roosterDoG2_conv); title("rooster-deviation0.5/4"); colorbar;
% subplot(2, 2, 3), imagesc(woodsDoG1_conv); title("woods-deviation2/6"); colorbar;
% subplot(2, 2, 4), imagesc(woodsDoG2_conv); title("woods-deviation0.5/4"); colorbar;
% colormap('gray');
% 
% figure('name', '6.2.1-2'), subplot(2, 2, 1), plot(shift, cc1); title("rooster-deviation2/6"); xlabel('shift'); ylabel('correlation coefficient');
% subplot(2, 2, 2), plot(shift, cc2); title("rooster-deviation0.5/4");  xlabel('shift'); ylabel('correlation coefficient');
% subplot(2, 2, 3), plot(shift, cc3); title("woods-deviation2/6");  xlabel('shift'); ylabel('correlation coefficient');
% subplot(2, 2, 4), plot(shift, cc4); title("woods-deviation0.5/4");  xlabel('shift'); ylabel('correlation coefficient');

% -------------------- task 7.1.1 --------------------
onGaussian_mask = fspecial('gaussian', 21, 2);
offGaussian_mask = fspecial('gaussian', 21, 3);

roosterRon_conv = conv2(Irooster(:, :, 1), onGaussian_mask, 'same');
roosterRoff_conv = conv2(Irooster(:, :, 1), offGaussian_mask, 'same');
roosterGon_conv = conv2(Irooster(:, :, 2), onGaussian_mask, 'same');
roosterGoff_conv = conv2(Irooster(:, :, 2), offGaussian_mask, 'same');
roosterBon_conv = conv2(Irooster(:, :, 3), onGaussian_mask, 'same');
roosterBoff_conv = conv2(Irooster(:, :, 3), offGaussian_mask, 'same');
roosterYon_conv = conv2(mean(Irooster(:, :, 1:2), 3), onGaussian_mask, 'same');
roosterYoff_conv = conv2(mean(Irooster(:, :, 1:2), 3), offGaussian_mask, 'same');

I1 = roosterRon_conv - roosterGoff_conv;
I2 = roosterGon_conv - roosterRoff_conv;
I3 = roosterBon_conv - roosterYoff_conv;
I4 = roosterYon_conv - roosterBoff_conv;

% figure('name', '7.1.1'), subplot(2, 2, 1), imagesc(I1); title("red-on, green-off"); colorbar;
% subplot(2, 2, 2), imagesc(I2); title("green-on, red-off"); colorbar;
% subplot(2, 2, 3), imagesc(I3); title("bule-on, yellow-off"); colorbar;
% subplot(2, 2, 4), imagesc(I4); title("yellow-on, blue-off"); colorbar;
% colormap;

% -------------------- task 8.1.1 --------------------
G_mask = fspecial('gaussian', 7, 1);

G1 = conv2(IDrooster, G_mask, 'same');
G_I1 = imresize(G1, 0.5);
G2 = conv2(G_I1, G_mask, 'same');
G_I2 = imresize(G2, 0.5);
G3 = conv2(G_I2, G_mask, 'same');
G_I3 = imresize(G3, 0.5);
G4 = conv2(G_I3, G_mask, 'same');
G_I4 = imresize(G4, 0.5);
G5 = conv2(G_I4, G_mask, 'same');

% figure('name', '8.1.1'), 
% a1 = subplot(2, 2, 1), imagesc(G_I1); title("I1"); colorbar;
% xs = get(a1, 'xlim'); ys = get(a1, 'ylim');
% a2 = subplot(2, 2, 2), imagesc(G_I2); title("I2"); colorbar;
% % set(a2, 'xlim', xs, 'ylim', ys);
% a3 = subplot(2, 2, 3), imagesc(G_I3); title("I3"); colorbar;
% % set(a3, 'xlim', xs, 'ylim', ys);
% a4 = subplot(2, 2, 4), imagesc(G_I4); title("I4"); colorbar;
% % set(a4, 'xlim', xs, 'ylim', ys);
% colormap(gray);

% -------------------- task 8.2.1 --------------------
L_I0 = G_I1 - G2;
L_I1 = G_I2 - G3;
L_I2 = G_I3 - G4;
L_I3 = G_I4 - G5;

figure('name', '8.2.1'), 
a1 = subplot(2, 2, 1), imagesc(L_I0); title("I1"); colorbar;
xs = get(a1, 'xlim'); ys = get(a1, 'ylim');
a2 = subplot(2, 2, 2), imagesc(L_I1); title("I2"); colorbar;
% set(a2, 'xlim', xs, 'ylim', ys);
a3 = subplot(2, 2, 3), imagesc(L_I2); title("I3"); colorbar;
% set(a3, 'xlim', xs, 'ylim', ys);
a4 = subplot(2, 2, 4), imagesc(L_I3); title("I4"); colorbar;
% set(a4, 'xlim', xs, 'ylim', ys);
colormap(gray);