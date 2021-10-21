%% other experiment 1: optimal parameters
% result: including all ANFIS models and other results
data.selecSet='gehlershi_and_cubep'; % GehlerShi,Cubep,gehlershi_and_cubep
opt = genCNCOptions('k1',2,'k2',2,'method','rgb','chkCutPoint',0.80,...
    'optimization',false,'NumClusters',4,'EpochNumber',60,'InitialStepSize',0.01,...
    'indMethod',[1 2 7 8],'cluster1Feature','featureTr','cluster2Feature','adjacentAngleError');
%
result = cluster2_anfis_cc(data,opt);
save(fullfile('results',[data.selecSet '.mat']),'result');
genResultXls(result,fullfile('results',[data.selecSet '.xlsx']));

%% other experiment 2: different parameters
datasetSelected={'Cubep','GehlerShi','gehlershi_and_cubep'};% datasetSelected{1,3}
indMethodSelect={0,1,[1 2],[1 2 3 4],[1 2 7 8],[2 3 6 7 8],[1 2 3 4 5 6 7 8],[3 4 5 6]};
for numRun=1:1
    for iDatSelected=[3] %3
        for iK1=2:2% 2
            for iK2=2:2 %4
                for jNumClu=[4] %[2 4 6]
                    for kEpochNum=[60] %[30 60 90]
                        for m_indMethod =5:5 %6
                            data.selecSet=datasetSelected{1,iDatSelected}; % GehlerShi,Cubep
                            % fisFeatCDF,fisFeatIIF,cmTr, featureTr,feat4Cheng,adjacentAngleError,illSet8TrNor; % log,rgb; indMethod = [1 2 7 8]; % auto
                            opt = genCNCOptions('k1',iK1,'k2',iK2,'method','rgb',...
                                'optimization',false,'NumClusters',jNumClu,'EpochNumber',kEpochNum,'InitialStepSize',0.01,...
                                'indMethod',indMethodSelect{1,m_indMethod},'cluster1Feature','featureTr','cluster2Feature','adjacentAngleError');
                            %
                            result = cluster2_anfis_cc(data,opt);
                            save(fullfile('results',[data.selecSet '.mat']),'result');
                            genResultXls(result,fullfile('results',[data.selecSet '.xlsx']));
                            %fprintf('\n current: iterationNum=%s;\n iDatSelected=%s,\n  iK1=%s,\n iK2=%s, \n jNumClu=%s,\n kEpochNum=%s,\n  m_indMethod=%s\n',...
                            %    num2str(iDatSelected*iK1*iK2*length(m_indMethod)*length(kEpochNum)*length(jNumClu)),...
                            %    num2str(iDatSelected),num2str(iK1),num2str(iK2),num2str(jNumClu),num2str(kEpochNum),num2str(m_indMethod));
                        end
                    end
                end
            end
        end
    end
end

%% other experiment 3: testing without weigthing
% result=load('resultOptimal.mat'); result=result.result;
ca=zeros(2275,1);
ill_est_gt=zeros(2275,6);
ill=zeros(2275,3);
gt=zeros(2275,3);
data_test=data;
for numModels=1:3
    model = result.Models(numModels).model;
    est_ill_nowht = testing_clu2anfis_rgb (data_test, model,opt);
    gt=data.gtIllumTr;
    [minAngle, meanAngle, medianAngle, trimeanAngle, best25, worst25, average, maxAngle]= ...
        calculateExtendedAngularStatistics(gt, est_ill_nowht);
    displayCalculatedAngularErrorStatistics(minAngle, meanAngle,...
        medianAngle, trimeanAngle, best25, worst25, average, maxAngle);
end
% single input image
noLoc=[10 20 30 40];
ae=[];
for i=1:length(noLoc)
    ae=[ae;colorangle(est_ill_nowht(i,:),gt(i,:))];
end
est_ill_nowht(noLoc,:)
gt(noLoc,:)
ae
%% other experiment 4: tesing with weighting
ca=zeros(2275,1);
ill_est_gt=zeros(2275,6);
ill=zeros(2275,3);
gt=zeros(2275,3);
noModel=zeros(2275,1);
w_mat=cell(2275,1);
wmax_ij=zeros(2275,2);

for fileNo=1:2275
    [c1f,c2f,if_in] = retriveFeature(fileNo,data,opt);
    noModel(fileNo,1)=findNoModels(fileNo,result);
    model = result.Models(noModel(fileNo,1)).model; 
    [eta,omega,w] = calcWeights(c1f,c2f,model,opt); w_mat{fileNo}=w;
    [wmax_ij(fileNo,1),wmax_ij(fileNo,2)]=find(max(w(:))==w);
    %w=ones(size(w)).*(w==max(w(:))); % no weighting
    est_ill=testing_single(c1f,c2f,if_in,w,model,opt);
    ca(fileNo,1)=colorangle(est_ill,data.gtIllumTr(fileNo,:));
    ill_est_gt(fileNo,:)=[est_ill data.gtIllumTr(fileNo,:)];
    ill(fileNo,:)=est_ill;
    gt(fileNo,:)=data.gtIllumTr(fileNo,:);
end
[minAngle, meanAngle, medianAngle, trimeanAngle, best25, worst25, average, maxAngle]= ...
    calculateExtendedAngularStatistics(gt, ill);
displayCalculatedAngularErrorStatistics(minAngle, meanAngle,...
    medianAngle, trimeanAngle, best25, worst25, average, maxAngle);