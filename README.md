# AnfisIllest
Illuminant estimation using adaptive neuro-fuzzy inference system

- Luo Yunhui, 07/09/2021

##### %% settings
clear;

clc;

addpath('.\utility');

addpath('.\func');

##### %% dataTrain
data=load('dataTrain.mat');

disp('Load data from dataTrain.mat');

data=data.dataTrain;

##### %% the tables and figures in the paper
% for tables in paper
mainTab23_GSCubep 

mainTab4_DiffClusNum

mainTab5_SelectAlgo

mainTab6_SparseWeight

mainTab7_OnceClus

% for figures in paper

mainFig2_PlotMembership 

mainFig34_QualityGehlerShi

mainFig567_QualityCubep

mainFig8_MinAEs %discarded

##### % additional experiment
mainCrossDatasetExperiment

mainOtherExperiment

