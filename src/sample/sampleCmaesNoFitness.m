function [arx, arxvalid, arz] = sampleCmaesNoFitness(xmean, sigma, lambda, BD, diagD, opts)
% sampleCmaesNoFitness  generates lambda points according to CMA-ES scheme
%
% No point is evaluated by the fitness
% TODO: test this!

  % CMA-ES sampling options
  noiseReevals = opts.noiseReevals;
  bnd.isactive = opts.isBoundActive;
  lbounds = opts.lbounds;
  ubounds = opts.ubounds;
  flgDiagonalOnly = opts.flgDiagonalOnly;
  noiseHandling = opts.noiseHandling;
  xintobounds = opts.xintobounds;

  isBoundActive = any(lbounds > -Inf) || any(ubounds < Inf); 
  N = size(xmean, 1);

  % Generate and evaluate lambda offspring
 distanceReduce=opts.dimReductionReduceDistance;
 origLambda=lambda;
 lambda=lambda*distanceReduce;
 arz = randn(N,lambda);

  if ~flgDiagonalOnly
    arx = repmat(xmean, 1, lambda) + sigma * (BD * arz); % Eq. (1)
  else
    arx = repmat(xmean, 1, lambda) + repmat(sigma * diagD, 1, lambda) .* arz; 
  end
  
  if(distanceReduce~=1)
      arxINBDBase=BD\arx;
      distances=1:lambda;
      for i=1:lambda
          distances(i)=getDistance(BD,arxINBDBase(:,i)',opts.dimReductionDimCnt);
      end
      [~,index]=sort(distances);
      arx=arx(:,index(1:origLambda));
      arz=arz(:,index(1:origLambda));
  end
  
  if noiseHandling 
    if noiseEpsilon == 0
      arx = [arx arx(:,1:noiseReevals)]; 
    elseif flgDiagonalOnly
      arx = [arx arx(:,1:noiseReevals) + ...
              repmat(noiseEpsilon * sigma * diagD, 1, noiseReevals) ...
              .* randn(N,noiseReevals)]; 
    else 
      arx = [arx arx(:,1:noiseReevals) + ...
              noiseEpsilon * sigma * ...
              (BD * randn(N,noiseReevals))]; 
    end
  end

  % You may handle constraints here. You may either resample
  % arz(:,k) and/or multiply it with a factor between -1 and 1
  % (the latter will decrease the overall step size) and
  % recalculate arx accordingly. Do not change arx or arz in any
  % other way.

  if ~isBoundActive
    arxvalid = arx;
  else
    arxvalid = xintobounds(arx, lbounds, ubounds);
  end

end
