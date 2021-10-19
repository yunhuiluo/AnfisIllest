function est=testing_single(c1f,c2f,if_in,w,model,opt)
%%
if nargin<2
    opt=genCNCOptions();
end
k1=model.dataCluSquare.k1;
k2=model.dataCluSquare.k2;

%% datin
if_in=if_in([1 2 4 5 7 8 10 11 13 14 16 17 19 20 22 23]);

%% predict
est=zeros(1,3);
est_ill = cell(k1,k2);
for i=1:k1
    for j=1:k2
        datin = if_in(model.inputlocation{i,j});
        r = evalfis(model.modelR{i,j},datin);
        g = evalfis(model.modelG{i,j},datin);
        b = evalfis(model.modelB{i,j},datin);
        [r,g,b]=checkRGB(r,g,b);
        est_ill{i,j} = normalizeChromaticity([r g b]);
        est_ill{i,j} = est_ill{i,j}*w(i,j);
        est=est+est_ill{i,j};
    end
end


%%
% [minAngle, meanAngle, medianAngle, trimeanAngle, best25, worst25, average, maxAngle]= ...
%     calculateExtendedAngularStatistics(data_test.gtIllumTr(468:568,:), est_ill(468:568,:));
% displayCalculatedAngularErrorStatistics(minAngle, meanAngle,...
%     medianAngle, trimeanAngle, best25, worst25, average, maxAngle);

