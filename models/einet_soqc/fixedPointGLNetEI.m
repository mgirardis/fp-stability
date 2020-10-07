function fp = fixedPointGLNetEI(par, s, r)
    if isscalar(s) && isscalar(r)
        xS = fixedPointKTLog_internal(par, s, r);
    else
        n = max([numel(r),numel(s)]);
        s = ones(1,n).*s;
        r = ones(1,n).*r;
        xS = cell(1,n);
        for i = 1:n
            xS{i} = fixedPointGLNetEI_internal(par, s(i), r(i));
        end
    end
    fp = struct('xS',[]);
    fp.xS = xS;
end

function rhoS = fixedPointGLNetEI_internal(par, s, rootSign)
    % r -> sign of the square root for rho+ or rho-
    A = -1 - par.h.*par.G0 + par.W.*par.G0;
    D = 2.*par.G0.*par.W;
    if s <= 0
        rhoS = 0.*par.J + 0.*par.W + 0.*par.h + 0.*par.G0;
        if isscalar(par.h)
            if par.h>0
                rhoS = NaN(size(rhoS));
            end
        else
            rhoS(par.h>0)=NaN;
        end
    else
        rhoS = (A + rootSign.*sqrt(A.^2+2.*D.*par.G0.*par.h))./D;
    end
%     thetaS = ones(size(rhoS));
%     return
    ind = (imag(rhoS) == 0) & (real(rhoS) <= 1) & (real(rhoS) >= 0);
%     ind = (imag(rhoS) == 0) & (real(rhoS) >= 0);
    rhoS(~ind) = NaN;
%     thetaS = ones(size(rhoS));
%     thetaS(isnan(rhoS)) = NaN;
end

% function [rhoS,thetaS] = fixedPointGLNetEI(par, s, rootSign, r)
% % the map is given by
% % rho = (1 - rho) * ( s*Gamma*(h + W*rho)*(1 - r) + r )
% % if s == r == 0 => rho = 0
% % if s == 0 and r == 1 => rho = 1 - rho => rho = 1/2
% % if s == 1 and r == 0 => the usual solution to the FP equation
% % if s == 1 and r == 1 => rho = 1-rho => rho = 1/2
%     % r -> sign of the square root for rho+ or rho-
%     sz = size(0.*par.J + 0.*par.W + 0.*par.h + 0.*par.G0);
%     W = par.W;
%     h = par.h;
%     G = par.G0;
%     if isscalar(h)
%         h = repmat(h,sz);
%     end
%     if isscalar(W)
%         W = repmat(W,sz);
%     end
%     if isscalar(G)
%         G = repmat(G,sz);
%     end
%     if s <= 0
%         if r <= 0
%             rhoS = zeros(sz);
%             rhoS(h>(1./G))=NaN;
%         else
%             rhoS = 0.5.*ones(sz);
%             rhoS(h<(1./G))=NaN;
%         end
%         rhoS(h>0)=NaN;
%     else
%         A = -1 - h.*G + W.*G0;
%         D = 2.*G.*W;
%         rhoS = (A + rootSign.*sqrt(A.^2+2.*D.*G.*h))./D;
%     end
% %     thetaS = ones(size(rhoS));
% %     return
%     ind = (imag(rhoS) == 0) & (real(rhoS) <= 1) & (real(rhoS) >= 0);
% %     ind = (imag(rhoS) == 0) & (real(rhoS) >= 0);
%     rhoS(~ind) = NaN;
%     thetaS = ones(size(rhoS));
%     thetaS(isnan(rhoS)) = NaN;
% end