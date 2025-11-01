%% Lab 4: Noise and Filtering
% Author: Rupashri Das
% Date: 01.11.2025
% MATLAB Online
%
% This script models noise, applies different filters, and compares
% their performance using MSE. Screenshots from each section
% should be added into the GitHub README.

close all; clear; clc;

%% 1) Load image and add two types of noise
I = im2double(rgb2gray(imread('peppers.png')));

I_gauss = imnoise(I, 'gaussian', 0, 0.01);    % Gaussian noise
I_sp    = imnoise(I, 'salt & pepper', 0.05);  % Salt & pepper noise

figure;
montage({I, I_gauss, I_sp}, 'Size', [1 3]);
title('Original | Gaussian noise | Salt & pepper noise');

%% 2) Compute quality metrics (MSE)
MSE_gauss = immse(I_gauss, I);
MSE_sp    = immse(I_sp, I);

fprintf('--- MSE Before Filtering ---\n');
fprintf('Gaussian Noise MSE:       %.4f\n', MSE_gauss);
fprintf('Salt & Pepper Noise MSE:  %.4f\n\n', MSE_sp);

%% 3) Linear filtering (Mean & Gaussian)
h_avg = fspecial('average', 3);
I_avg_gauss = imfilter(I_gauss, h_avg, 'replicate');
I_avg_sp    = imfilter(I_sp,    h_avg, 'replicate');

h_gauss = fspecial('gaussian', [3 3], 0.7);
I_gauss_gauss = imfilter(I_gauss, h_gauss, 'replicate');

%% 4) Non-linear filtering (Median)
I_med_gauss = medfilt2(I_gauss, [3 3]);
I_med_sp    = medfilt2(I_sp,    [3 3]);

figure;
montage({I_avg_sp, I_med_sp, I_avg_gauss, I_med_gauss}, 'Size', [2 2]);
title('Top: Avg vs Median (S&P) | Bottom: Avg vs Median (Gaussian)');

%% 5) Compare MSE after filtering
MSE_avg_sp  = immse(I_avg_sp,  I);
MSE_med_sp  = immse(I_med_sp,  I);

MSE_avg_gauss  = immse(I_avg_gauss,  I);
MSE_med_gauss  = immse(I_med_gauss,  I);

fprintf('--- MSE After Filtering ---\n');
fprintf('Salt & Pepper:  Avg = %.4f | Median = %.4f\n', MSE_avg_sp, MSE_med_sp);
fprintf('Gaussian Noise: Avg = %.4f | Median = %.4f\n\n', MSE_avg_gauss, MSE_med_gauss);

%% 6) Reflection questions (answers go in README)
% - Which noise is best removed by median filter? Why?
% - Why does linear filtering blur edges more?
% - How could we design adaptive filters to preserve detail?
