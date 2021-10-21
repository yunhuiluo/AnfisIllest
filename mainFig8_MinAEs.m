% plotFigureMinAE
load('dataTrain.mat');
ae=dataTrain.colorangle;
[min_ae,I]=min(ae,[],2);

J1=find(I==1); minGW = min_ae(J1,1);
J2=find(I==2); minWP= min_ae(J2,1);
J3=find(I==3); minSoG= min_ae(J3,1);
J4=find(I==4); minGE1= min_ae(J4,1);
J5=find(I==5); minGE2= min_ae(J5,1);
J6=find(I==6); minGGW= min_ae(J6,1);
J7=find(I==7); minPCA_based= min_ae(J7,1);
J8=find(I==8); minLSR= min_ae(J8,1);

%%
% AEs = dataTrain.colorangle;
% minAEs = min(AEs,[],2); % max(minAEs)
% edges = (1:10);
% [counts,centers] = hist(minAEs,edges);
% [counts1,centers] = hist(minGW,edges);
% [counts2,centers] = hist(minWP,edges);
% [counts3,centers] = hist(minSoG,edges);
% [counts4,centers] = hist(minGE1,edges);
% [counts5,centers] = hist(minGE2,edges);
% [counts6,centers] = hist(minGGW,edges);
% [counts7,centers] = hist(minPCA_based,edges);
% [counts8,centers] = hist(minLSR,edges);
% % histogram
% figure
% h=bar(centers,[counts1;counts2;counts3;counts4;counts5;counts6;counts7;counts8;]);
% 
% hold on
% B1 = cumsum(counts1);
% % plot(centers,B,'r*-')
% xlabel('the minimal AEs');
% ylabel('number of images');
% set(gca,'Xtick',1:1:10);
% set(gca,'XTicklabel',num2cell([1:1:10]));
% legend('histogram of the minimal AEs'' distribution','cumsum of the minimal AEs'' distribution');
% %% cumsum of image number
% hy = get(h(1),'YData'); % 
% hx = [1:1:12];
% % label
% for k=1:12
%     %text(hx(k), hy(k)+70, num2cell(hy(k))); 
%     if k>1
%         text(hx(k), B1(k)+70, num2cell(B1(k)));
%     end
% end
% 

%%
figure
x = [minGW;minWP;minSoG;minGE1;minGE2;minGGW;minPCA_based;minLSR];

g1 = repmat({'GW'},length(J1),1);
g2 = repmat({'WP'},length(J2),1);
g3 = repmat({'SoG'},length(J3),1);
g4 = repmat({'GE1'},length(J4),1);
g5 = repmat({'GE2'},length(J5),1);
g6 = repmat({'GGW'},length(J6),1);
g7 = repmat({'PCA-based'},length(J7),1);
g8 = repmat({'LSR'},length(J8),1);

g = [g1; g2; g3;g4; g5; g6;g7; g8];
boxplot(x,g),%grid on

text(1.1,3,num2str(length(J1)))
text(2.1,3,num2str(length(J2)))
text(3.1,2,num2str(length(J3)))
text(4.1,2,num2str(length(J4)))
text(5.1,3,num2str(length(J5)))
text(6.1,4,num2str(length(J6)))
text(7.1,2,num2str(length(J7)))
text(8.1,7,num2str(length(J8)))
ylabel('The minimum AEs')
xlabel('The unitary algorithms')
title('(a)')
%%
fileFolder = fullfile('results');
print(gcf,'-r600','-djpeg',fullfile(fileFolder, 'FigAEboxplot.jpg'));
%%
figure
plot( dataTrain.colorangle(469:668,1),'*');hold on
plot( dataTrain.colorangle(469:668,2),'*');hold on
plot( dataTrain.colorangle(469:668,3),'*');hold on
plot( dataTrain.colorangle(469:668,4),'*');hold on
plot( dataTrain.colorangle(469:668,5),'*');hold on
plot( dataTrain.colorangle(469:668,6),'*');hold on
plot( dataTrain.colorangle(469:668,7),'*');hold on
plot( dataTrain.colorangle(469:668,8),'*');hold on
plot( result.angular_error(469:668),'rs-','Linewidth',2)
legend('GW','WP','SoG','GE1','GE2','GGW','PCA-based','LSR','Proposed');
axis([0 200 0 30])
title('(b)')
xlabel('No. of the images')
ylabel('The minimum AEs')
%%
fileFolder = fullfile('results');
print(gcf,'-r600','-djpeg',fullfile(fileFolder, 'FigAEdistribution.jpg'));
%% figure, plot(result.angular_error(569:2275))
% figure
% plot(dataTrain.colorangle(569:769,1),'*');hold on
% plot(dataTrain.colorangle(569:769,2),'*');hold on
% plot(dataTrain.colorangle(569:769,3),'*');hold on
% plot(dataTrain.colorangle(569:769,4),'*');hold on
% plot(dataTrain.colorangle(569:769,5),'*');hold on
% plot(dataTrain.colorangle(569:769,6),'*');hold on
% plot(dataTrain.colorangle(569:769,7),'*');hold on
% plot(dataTrain.colorangle(569:769,8),'*');hold on
% plot(result.angular_error(569:569+200),'rs-','Linewidth',2)
% legend('GW','WP','SoG','GE1','GE2','GGW','PCA-based','LSR','Proposed');