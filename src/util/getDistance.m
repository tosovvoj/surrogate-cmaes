function [ euclidianDistance ] = getDistance( base,pointInBase,cut)
%GETDISTANCE Summary of this function goes here Return the distance of the
%poitn pointInBase from base base if we cut the last cut dimensions.
%   Detailed explanation goes here
normOfBases=arrayfun(@(idx) norm(base(idx,:)), 1:size(base,1));
[~ ,origDimension]=size(base);
leftPart=zeros(1:origDimension-cut);
rightPart=ones(1:cut);
selector=[leftPart rightPart];
selector=selector.*normOfBases;
deviationInDimension=pointInBase*selector';
euclidianDistance=norm(deviationInDimension);
disp(euclidianDistance);
end
