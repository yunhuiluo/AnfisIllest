%% init
% data=load('dataTrain.mat');data=data.dataTrain;
opt = genCNCOptions('k1',2,'k2',2,'method','rgb','chkCutPoint',0.80,...
    'optimization',false,'NumClusters',4,'EpochNumber',30,'InitialStepSize',0.01,...
    'indMethod',[1 2 7 8],'cluster1Feature','featureTr','cluster2Feature','adjacentAngleError');
datasetSelected={'Cubep','GehlerShi','gehlershi_and_cubep'};% datasetSelected{1,3}
%% for table 2 (Gehler-Shi) and table 3 (Cube+ dataset)
for runtimes=1:2
    for i=1:2
        data.selecSet=datasetSelected{i}; % GehlerShi,Cubep,gehlershi_and_cubep
        result = cluster2_anfis_cc(data,opt);
        save(fullfile('results',[data.selecSet '.mat']),'result');
        %Cubep.xlsx, GehlerShi.xlsx,gehlershi_and_cubep.xlsx
        genResultXls(result,fullfile('results',[data.selecSet '.xlsx']));
    end
end