%% liveLog.m
% Appends a text log file continuously
% Press CTRL + C twice quickly to stop

clear all; close all; clc

fileName = 'outLog';
numPoints = 200; % for plot
data = zeros(numPoints,1);
n=0;
outFID = fopen(fileName,'w'); %overwrite old
outFID = fclose(outFID);

while 1
    n=n+1;
    m = mod(n,numPoints)
    
    % dataline = readline(s);
    % data(n) = str2num(dataline);
    data(end) = m;
    data = circshift(data,-1);
    plot(data);drawnow
    outFID = fopen(fileName,'a');
    fprintf(outFID,'%.2f\n',m);
    outFID = fclose(outFID);
end