function [ badness ] = badness( ref,aprox,weights,maxIndex)
 [cnt,~]=size(aprox);
refDir=zeros(maxIndex,1);
refDir(ref)=weights;
aproxDir=zeros(maxIndex,1);
aproxDir(aprox)=weights;

worstDir=zeros(maxIndex,1);
worstDir(1:cnt)=weights;
bestDir=zeros(maxIndex,1);
bestDir(maxIndex-cnt+1:maxIndex)=flipud(weights);
normdiff=worstDir-bestDir;
normalizeConst=sum(abs(normdiff));
% normalizeConst=norm(normdiff);


difference=(refDir-aproxDir);
distance=sum(abs(difference));
badness=distance/normalizeConst;

end


