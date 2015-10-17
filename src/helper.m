function [ correctPresumtion ] = helper( p_model, B, point ,divisor)
%HELPER Summary of this function goes here
%   Detailed explanation goes here
y=p_model.predict(point);
result=1:size(B,2);
    for col_index= 1:size(B,2)
        actCol=B(:,col_index);
        shift=B*actCol;   
       (norm(shift));
       shift=shift/divisor;
        y_shifted=p_model.predict(point+shift');
        diff=y-y_shifted;
        result(col_index)=diff;
    end
    correctPresumtion=result;
end

% (changeMatrix*point')+actCol


