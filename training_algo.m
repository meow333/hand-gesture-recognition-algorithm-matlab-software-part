%Training Algorithm

X = [];

labels = [];

num_train = 20;

for i = 1 : num_train
    temp = normalizetimeaxis(1000,grasp{i});
    X = [X; temp'];
    labels = [labels ; 1];
end

for i = 1 : num_train
    temp = normalizetimeaxis(1000,palm{i});
    X = [X; temp'];
    labels = [labels ; 2];
end

for i = 1 : num_train
    temp = normalizetimeaxis(1000,wave{i});
    X = [X; temp'];
    labels = [labels ; 3];
end

SX = []; % Spectrogram features
for i = 1 : size(X,1)
data = X(i,:);
[s,f,t,p] = spectrogram(data,128,120,128,1E3);
psd = 10*log10(abs(p));
SX(i,:) = psd(:)';
end

SX(find(SX==-Inf)) = 0;

[coefs,scores,variances,t2] = princomp(SX);

figure,
scatter3(scores(1:20,1),scores(1:20,2),scores(1:20,3),'r*') , hold on
scatter3(scores(21:40,1),scores(21:40,2),scores(21:40,3),'k*') , hold on
scatter3(scores(41:60,1),scores(41:60,2),scores(41:60,3),'b*') , hold off
