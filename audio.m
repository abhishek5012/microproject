

% taking the two audios
% recording the two audios
F=44100; bits=16; channels=1;



u='first.wav';
v='second.wav';
 


r=audiorecorder(F,bits,channels);
disp('audio starting first  recording ');
duration=3;
recordblocking(r,duration);
disp('stop')
z=getaudiodata(r)
audiowrite(u,z,F)


r=audiorecorder(F,bits,channels);
disp('audio starting recording ');
duration=3;
recordblocking(r,duration);
disp('stop')
z=getaudiodata(r)
sound(z,F,bits)
audiowrite(v,z,F)






% now the extraction of the data that is stored in the recording








[fe,fo]=audioread(u);
%second voice
[gh,go]=audioread(v);
b=ones(40,1)/40;
%making of the low pass filter to remove the noise from the signal
w=filter(b,1,fe);
g=filter(b,1,gh);
%find the fast fourier transform in 1024bits in order to get into freq
%domain
kl=fft(w,1024);
ml=fft(g,1024);
%take the absolute value of the fft transform as it also have the negative
%terms and calculate the peaks
mc=mean(abs(kl));
mb=mean(abs(ml));
% check for the condition wether the voice is the male or the female
if mc>mb
    disp(['given the first voice is the ' ...
        '.female']);
else 
    disp('given first voice is male');
end 
% plotting the graph 
% for the female ml and the male kl
plot(abs(ml));hold on;plot(abs(kl,'--'));hold off;
