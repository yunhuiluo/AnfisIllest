%% example plos tof input membership functions
result=load('resultOptimal.mat'); result=result.result;
model=result.Models(1).model;
%% plot input membership function: R
fis=model.modelR{1, 1};
fis.Inputs(1, 1).Name='r_1';fis.Inputs(1, 2).Name='g_1';
fis.Inputs(1, 3).Name='r_2';fis.Inputs(1, 4).Name='g_2';
fis.Inputs(1, 5).Name='r_7';fis.Inputs(1, 6).Name='g_7';
fis.Inputs(1, 7).Name='r_8';fis.Inputs(1, 8).Name='g_8';
for i=[2 6]
    fis.Inputs(1, i).Range(1,1)=0.35;
    fis.Inputs(1, i).Range(1,2)=0.55;
end
noInput=8;noCol=fix((noInput+1)/2);
figure;
for i=1:noInput
    [x,mf] = plotmf(fis,'input',i);
    subplot(2,noCol,i);
    plot(x,mf);
    xlabel(fis.Inputs(1, i).Name);
    ylabel('degree of membership');
end
sgt=sgtitle('(a)');
sgt.FontSize = 12;
print(gcf,'-r600','-djpeg',fullfile('results','fig4(a).jpg'));
%% plot input membership function: G
fis=model.modelG{1, 1};
fis.Inputs(1, 1).Name='r_1';fis.Inputs(1, 2).Name='g_1';
fis.Inputs(1, 3).Name='r_2';fis.Inputs(1, 4).Name='g_2';
fis.Inputs(1, 5).Name='r_7';fis.Inputs(1, 6).Name='g_7';
fis.Inputs(1, 7).Name='r_8';fis.Inputs(1, 8).Name='g_8';
for i=[2 6]
    fis.Inputs(1, i).Range(1,1)=0.35;
    fis.Inputs(1, i).Range(1,2)=0.55;
end
noInput=8;noCol=fix((noInput+1)/2);
figure;
for i=1:noInput
    [x,mf] = plotmf(fis,'input',i);
    subplot(2,noCol,i);
    plot(x,mf);
    xlabel(fis.Inputs(1, i).Name);
    ylabel('degree of membership');
end
sgt=sgtitle('(b)');
sgt.FontSize = 12;
print(gcf,'-r600','-djpeg',fullfile('results','fig4(b).jpg'));
%% plot input membership function: B
fis=model.modelB{1, 1};
fis.Inputs(1, 1).Name='r_1';fis.Inputs(1, 2).Name='g_1';
fis.Inputs(1, 3).Name='r_2';fis.Inputs(1, 4).Name='g_2';
fis.Inputs(1, 5).Name='r_7';fis.Inputs(1, 6).Name='g_7';
fis.Inputs(1, 7).Name='r_8';fis.Inputs(1, 8).Name='g_8';
for i=[2 6]
    fis.Inputs(1, i).Range(1,1)=0.35;
    fis.Inputs(1, i).Range(1,2)=0.55;
end
noInput=8;noCol=fix((noInput+1)/2);
figure;
for i=1:noInput
    [x,mf] = plotmf(fis,'input',i);
    subplot(2,noCol,i);
    plot(x,mf);
    xlabel(fis.Inputs(1, i).Name);
    ylabel('degree of membership');
end
sgt=sgtitle('(c)');
sgt.FontSize = 12;
print(gcf,'-r600','-djpeg',fullfile('results','fig4(c).jpg'));