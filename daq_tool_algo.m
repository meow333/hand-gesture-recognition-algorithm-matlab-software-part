%% configure the device

ai=analoginput('name of daq device','device ID');
addchannel(ai,number of channels);
set (ai, 'SampleRate', figure in numbers);
set(ai,'SamplesPerTrigger',figure in numbers);


%% start acquisition

tic
start(ai);
while isrunning(ai)
data=getdata(ai,figure in numbers in SamplesPerTrigger line);
end
toc
stop(ai);
