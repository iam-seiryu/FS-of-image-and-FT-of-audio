% read audio file
% get audio data and sample rate
file_name = input("Type audio name: ", 's');
[y,Fs] = audioread("audio/"+file_name+".wav");
t = 0:length(y)-1;
save(file_name+".mat",'y','Fs','t');