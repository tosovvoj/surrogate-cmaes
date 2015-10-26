classdef SWException < MException
    %SWEXCEPTION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        yTest
        xValidTest
        error
        model
        yPredictReduce
        originException;
    end
    
    methods
        function obj = SWException(arg1,arg2);
        obj@MException(arg1,arg2);
   end
    end
    
end

