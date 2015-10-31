function [XReduce] = reduceDimensionality(BD,selector,X)
changeMatrix=(inv(BD));
changeMatrix=changeMatrix(selector,:);
XReduce=changeMatrix*X';
XReduce=XReduce';
end