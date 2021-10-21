%% init
% result=load('resultOptimal.mat'); result=result.result;
% data=load('dataTrain.mat'); data=data.dataTrain;
ca=zeros(2275,1);
ill_est_gt=zeros(2275,6);
ill=zeros(2275,3);
gt=zeros(2275,3);
noModel=zeros(2275,1);
w_mat=cell(2275,1);
wmax_ij=zeros(2275,2);

%% set different threshold
weightThd_mat=[0.01 0.05 0.1 0.15 0.2 0.25];
for i=1:6
    opt.weightThd = weightThd_mat(1,i);
    disp(['For weightThd = ' opt.weightThd ':'])
    
    for fileNo=1:2275
        [c1f,c2f,if_in] = retriveFeature(fileNo,data,opt);
        noModel(fileNo,1)=findNoModels(fileNo,result);
        model = result.Models(noModel(fileNo,1)).model;
        [eta,omega,w] = calcWeights(c1f,c2f,model,opt); w_mat{fileNo}=w;
        %[wmax_ij(fileNo,1),wmax_ij(fileNo,2)]=find(max(w(:))==w);
        %w=ones(size(w)).*(w==max(w(:))); % just select most possiplbe one
        est_ill=testing_single(c1f,c2f,if_in,w,model,opt);
        %ca(fileNo,1)=colorangle(est_ill,data.gtIllumTr(fileNo,:));
        %ill_est_gt(fileNo,:)=[est_ill data.gtIllumTr(fileNo,:)];
        ill(fileNo,:)=est_ill;
        gt(fileNo,:)=data.gtIllumTr(fileNo,:);
    end
    [minAngle, meanAngle, medianAngle, trimeanAngle, best25, worst25, average, maxAngle]= ...
        calculateExtendedAngularStatistics(gt, ill);
    displayCalculatedAngularErrorStatistics(minAngle, meanAngle,...
        medianAngle, trimeanAngle, best25, worst25, average, maxAngle);
    %
    filename = fullfile('results','SparseWeightTabS3.xlsx');
    genResultSparseWeightTab(ill,gt,opt.weightThd,filename);
end