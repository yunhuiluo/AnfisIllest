%% 
datasetSelected={'Cubep','GehlerShi','gehlershi_and_cubep'};% datasetSelected{1,3}
indMethodSelect={[1 2 7 8]};
%% for OnceClusTab: k1=1
for numRun=1:1
    for iDatSelected=[3] %3
        for iK1=1:1% 2
            for iK2=[1 2 3 4 6] %4
                for jNumClu=[4] %[2 4 6]
                    for kEpochNum=[30] %[30 60 90]
                        for m_indMethod =1:1 %6
                            data.selecSet=datasetSelected{1,iDatSelected}; % GehlerShi,Cubep
                            % cmTr, featureTr,feat4Cheng,adjacentAngleError,illSet8TrNor; % log,rgb; indMethod = [1 2 7 8]; % auto
                            opt = genCNCOptions('k1',iK1,'k2',iK2,'method','rgb',...
                                'optimization',false,'NumClusters',jNumClu,'EpochNumber',kEpochNum,'InitialStepSize',0.01,...
                                'indMethod',indMethodSelect{1,m_indMethod},'cluster1Feature','featureTr','cluster2Feature','adjacentAngleError');
                            %
                            result = cluster2_anfis_cc(data,opt);
                            %save(fullfile('results',[data.selecSet '.mat']),'result');
                            genResultXls(result,fullfile('results',[data.selecSet '.xlsx']));
                            genResultOnceClusTab(result,fullfile('results','OneStepClus.xlsx'));
                            fprintf('\n current: iterationNum=%s;\n iDatSelected=%s,\n  iK1=%s,\n iK2=%s, \n jNumClu=%s,\n kEpochNum=%s,\n  m_indMethod=%s\n',...
                                num2str(iDatSelected*iK1*iK2*length(m_indMethod)*length(kEpochNum)*length(jNumClu)),...
                                num2str(iDatSelected),num2str(iK1),num2str(iK2),num2str(jNumClu),num2str(kEpochNum),num2str(m_indMethod));
                        end
                    end
                end
            end
        end
    end
end

%% for OnceClusTab: k2=1
for numRun=1:1
    for iDatSelected=[3] %3
        for iK1=[2 3 4 6]% 2
            for iK2=1:1 %4
                for jNumClu=[4] %[2 4 6]
                    for kEpochNum=[30] %[30 60 90]
                        for m_indMethod =1:1 %6
                            data.selecSet=datasetSelected{1,iDatSelected}; % GehlerShi,Cubep
                            % cmTr, featureTr,feat4Cheng,adjacentAngleError,illSet8TrNor; % log,rgb; indMethod = [1 2 7 8]; % auto
                            opt = genCNCOptions('k1',iK1,'k2',iK2,'method','rgb',...
                                'optimization',false,'NumClusters',jNumClu,'EpochNumber',kEpochNum,'InitialStepSize',0.01,...
                                'indMethod',indMethodSelect{1,m_indMethod},'cluster1Feature','featureTr','cluster2Feature','adjacentAngleError');
                            %
                            result = cluster2_anfis_cc(data,opt);
                            %save(fullfile('results',[data.selecSet '.mat']),'result');
                            genResultXls(result,fullfile('results',[data.selecSet '.xlsx']));
                            genResultOnceClusTab(result,fullfile('results','OneStepClus.xlsx'));
                            fprintf('\n current: iterationNum=%s;\n iDatSelected=%s,\n  iK1=%s,\n iK2=%s, \n jNumClu=%s,\n kEpochNum=%s,\n  m_indMethod=%s\n',...
                                num2str(iDatSelected*iK1*iK2*length(m_indMethod)*length(kEpochNum)*length(jNumClu)),...
                                num2str(iDatSelected),num2str(iK1),num2str(iK2),num2str(jNumClu),num2str(kEpochNum),num2str(m_indMethod));
                        end
                    end
                end
            end
        end
    end
end

%% for OnceClusTab: k1=k2=2
for numRun=1:10
    for iDatSelected=[3] %3
        for iK1=2:2% 2
            for iK2=2:2 %4
                for jNumClu=[4] %[2 4 6]
                    for kEpochNum=[30] %[30 60 90]
                        for m_indMethod =1:1 %6
                            data.selecSet=datasetSelected{1,iDatSelected}; % GehlerShi,Cubep
                            % cmTr, featureTr,feat4Cheng,adjacentAngleError,illSet8TrNor; % log,rgb; indMethod = [1 2 7 8]; % auto
                            opt = genCNCOptions('k1',iK1,'k2',iK2,'method','rgb',...
                                'optimization',false,'NumClusters',jNumClu,'EpochNumber',kEpochNum,'InitialStepSize',0.01,...
                                'indMethod',indMethodSelect{1,m_indMethod},'cluster1Feature','featureTr','cluster2Feature','adjacentAngleError');
                            %
                            result = cluster2_anfis_cc(data,opt);
                            %save(fullfile('results',[data.selecSet '.mat']),'result');
                            genResultXls(result,fullfile('results',[data.selecSet '.xlsx']));
                            genResultOnceClusTab(result,fullfile('results','OneStepClus.xlsx'));
                            fprintf('\n current: iterationNum=%s;\n iDatSelected=%s,\n  iK1=%s,\n iK2=%s, \n jNumClu=%s,\n kEpochNum=%s,\n  m_indMethod=%s\n',...
                                num2str(iDatSelected*iK1*iK2*length(m_indMethod)*length(kEpochNum)*length(jNumClu)),...
                                num2str(iDatSelected),num2str(iK1),num2str(iK2),num2str(jNumClu),num2str(kEpochNum),num2str(m_indMethod));
                        end
                    end
                end
            end
        end
    end
end
