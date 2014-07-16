%% Classification Testing

n = 10; %no of features
method = 'diagQuadratic';

graspresult = [];

for i = 1 : length(grasp)
    test = normalizetimeaxis(1000,grasp{i}) ;
    [s,f,t,p] = spectrogram(test,128,120,128,1E3);
    psd = 10*log10(abs(p));
    
    test = psd(:)';
    test = test - mean(SX); % remove mean
    features = test*coefs;

    c = classify(features(1:n),scores(:,1:n),labels,method);
    graspresult(i) = c;
end

palmresult = [];
for i = 1 : length(palm)
    test = normalizetimeaxis(1000,palm{i}) ;
    [s,f,t,p] = spectrogram(test,128,120,128,1E3);
    psd = 10*log10(abs(p));

    test = psd(:)';
    test = test - mean(SX); % remove mean
    features = test*coefs;
    
    c = classify(features(1:n),scores(:,1:n),labels,method);
    palmresult(i) = c;
end

waveresult = [];
for i = 1 : length(wave)
    test = normalizetimeaxis(1000,wave{i}) ;
    [s,f,t,p] = spectrogram(test,128,120,128,1E3);
    psd = 10*log10(abs(p));
    
    test = psd(:)';
    test = test - mean(SX); % remove mean
    features = test*coefs;

    c = classify(features(1:n),scores(:,1:n),labels,method);
    waveresult(i) = c;
end
