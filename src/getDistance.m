% 
function [ euclidianDistance ] = getDistance( base,pointInKB,usedDim,neglectDim,diagD)
[~ ,origDimension]=size(base);
kontrola=diagD;
changeMatrix=(eye(origDimension)/base);
pointINSB=changeMatrix*pointInKB';
pointINSB=pointINSB';
normOfBases=arrayfun(@(idx) norm(base(:,idx)), 1:size(base,1));
leftPart=ones(1,(neglectDim));
rightPart=zeros(1,usedDim);
selector=[leftPart rightPart];
selector=selector.*normOfBases;% odebrat
selector=diag(selector);
deviationInDimension=pointINSB*selector;
euclidianDistance=arrayfun(@(idx) norm(deviationInDimension(idx,:)), 1:size(deviationInDimension,1));
end