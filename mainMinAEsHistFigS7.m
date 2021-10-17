%% show histogram of minimal AEs' distribution for all images
% data=load('dataTrain.mat');data=data.data;
AEs = dataTrain.colorangle;
minAEs = min(AEs,[],2); % max(minAEs)
%histogram(minAEs);
edges = (1:17);
% histogram(minAEs,edges,'Normalization','probability');
% hold on
% histogram(minAEs,edges,'Normalization','cdf');
[counts,centers] = hist(minAEs,edges);
% histogram
h=bar(centers,counts);
hold on
B = cumsum(counts);
plot(centers,B,'r*-')
xlabel('the minimal AEs');
ylabel('number of images');
set(gca,'Xtick',1:1:17);
set(gca,'XTicklabel',num2cell([1:1:17]));
legend('histogram of the minimal AEs'' distribution','cumsum of the minimal AEs'' distribution');
% cumsum of image number
hy = get(h(1),'YData'); % 
hx = [1:1:17];
% label
for k=1:17
    text(hx(k), hy(k)+70, num2cell(hy(k))); 
    if k>1
        text(hx(k), B(k)+70, num2cell(B(k)));
    end
end
%%
fileFolder = fullfile('results');
print(gcf,'-r600','-djpeg',fullfile(fileFolder, 'Fig9AEHist.jpg'));