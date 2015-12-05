function [ badness ] = badness( ref,aprox,weights,maxIndex)
% [~,cnt]=size(aprox);
% weights=[weights; zeros(cnt,1)];
% [index,~]=sort(ref);
orderedWeights=zeros(maxIndex,1);
orderedWeights(ref)=weights;
% tmp=(cnt+1)*ones(cnt,1);
% weights=weights([ndex;tmp]);
refDir=orderedWeights(ref);
aproxDir=orderedWeights(aprox);
distance=norm(refDir-aproxDir);
badness=distance;

end


