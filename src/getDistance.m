% 
function [ euclidianDistance ] = getDistance( base,pointInKB,cut,diagD)
[~ ,origDimension]=size(base);
kontrola=diagD;
changeMatrix=(eye(origDimension)/base);
pointINSB=changeMatrix*pointInKB';
pointINSB=pointINSB'
normOfBases=arrayfun(@(idx) norm(base(:,idx)), 1:size(base,1));
rightPart=zeros(1,(origDimension-cut));
leftPart=ones(1,(cut));
selector=[leftPart rightPart];
selector=selector.*normOfBases;
selector=diag(selector);
deviationInDimension=pointINSB*selector;
euclidianDistance=arrayfun(@(idx) norm(deviationInDimension(idx,:)), 1:size(deviationInDimension,1));
disp(euclidianDistance);
end