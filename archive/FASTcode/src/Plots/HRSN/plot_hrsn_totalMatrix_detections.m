close all
clear

addpath('../Check/');

% 20071026
dt = 0.5;
catalogFile = '../../../data/TimeSeries/HRSN/cat20071026.txt';
eqcatTimes = [2233 6617.5 29472 29935.5 31443.5 34634 35389.5 37907 43536.5 64091.5 68890 78295.5 85999.5];
titleStr = 'totalMatrix_HRSN_39ch_20071026_24hr';
fileName = 'fast_wLen6_wLag0.05_fpLen64_fpLag10_tvalue400_nfuncs5_ntbls100_nvotes4_thresh0.3.mat';
% titleStr = 'totalMatrix_HRSN_28ch_20071026_24hr';
% fileName = 'fast_wLen6_wLag0.05_fpLen64_fpLag10_tvalue400_nfuncs5_ntbls100_nvotes4_thresh0.2.mat';
% titleStr = 'totalMatrix_HRSN_18ch_20071026_24hr';
% fileName = 'fast_wLen6_wLag0.05_fpLen64_fpLag10_tvalue400_nfuncs5_ntbls100_nvotes4_thresh0.15.mat';
% titleStr = 'totalMatrix_HRSN_12ch_20071026_24hr';
% fileName = 'fast_wLen6_wLag0.05_fpLen64_fpLag10_tvalue400_nfuncs5_ntbls100_nvotes4_thresh0.15.mat';
ymax = 6;

% % 20060509
% dt = 0.5;
% catalogFile = '../../../data/TimeSeries/HRSN/cat20060509.txt';
% eqcatTimes = [876.5 925 1892.5 1941 13156.5 19460 22029.5 22151 29989 45482.5 45898.5 61007 66042 66056.5 66088.5 66103];
% titleStr = 'totalMatrix_HRSN_36ch_20060509_24hr';
% fileName = 'fast_wLen6_wLag0.05_fpLen64_fpLag10_tvalue400_nfuncs5_ntbls100_nvotes4_thresh0.3.mat';
% % titleStr = 'totalMatrix_HRSN_21ch_20060509_24hr';
% % fileName = 'fast_wLen6_wLag0.05_fpLen64_fpLag10_tvalue400_nfuncs5_ntbls100_nvotes4_thresh0.2.mat';
% % titleStr = 'totalMatrix_HRSN_15ch_20060509_24hr';
% % fileName = 'fast_wLen6_wLag0.05_fpLen64_fpLag10_tvalue400_nfuncs5_ntbls100_nvotes4_thresh0.15.mat';
% % titleStr = 'totalMatrix_HRSN_12ch_20060509_24hr';
% % fileName = 'fast_wLen6_wLag0.05_fpLen64_fpLag10_tvalue400_nfuncs5_ntbls100_nvotes4_thresh0.15.mat';
% ymax = 4;

% Read in detections
fileDir = strcat('/data/cees/ceyoon/FASTcode/data/OutputFAST/', titleStr, '/');
filePath = strcat(fileDir, fileName);
load(filePath);

% Read in catalog file
fid = fopen(catalogFile, 'r');
catData = textscan(fid, '%s %s %s %s %s %s %s %s %*[^\n]');
fclose(fid);
catTimes = str2double(catData{4});
catValues = 10*ones(size(catTimes));
eqcatValues = 10*ones(size(eqcatTimes));

% Plot
stem(catTimes, catValues, 'm');
hold on
qq=stem(eqcatTimes, eqcatValues);
set(qq, 'color', [0 0.8 0]);
plot_detection_indices(totalPairs.i, totalPairs.j, totalPairs.k, dt, ...
    titleStr, 'Network similarity');
hold off
ylim([0 ymax]);