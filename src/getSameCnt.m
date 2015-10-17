function [ sameCnt ] = getSameCnt( array1, array2 )
[same] = arrayfun(@(x) any(x==array1), array2);
sameCnt=sum(same);


end

