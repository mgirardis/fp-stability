function G = stabilityLimitGLMFNet_Gamma(par)
% this function returns the stability limits as function of a given paramater
% inside the par struct
% par struct must contain only one parameter which is a vector of points where the Gamma will be evaluated
%
% the GG functions below were calculated by hand (Mathematica)
%
% the algorithm for this function is like follows:
% 1) calculates the GG functions for all the interval given in the vector parameter
% 2) replaces non-real or infinity by NaN solutions (deletes completely complex or infinity solutions)
%
% returns: G is a 1xn cell array where n is the number of remaining solutions

    GG1 = @(J,mu,VB) (-1).*(1-mu).*(J+(VB.*(1-mu))).^(-1);
    GG2 = @(J,mu,VB) (-1).*((-1)+(1-mu)).^(-1).*(1-mu).^2.*(J+(1+(1-mu)).*(VB.*(1-mu))).^(-2).*(J.*(1+(1-mu))+((-1)+(1-mu).*(2+(1-mu))).*(VB.*(1-mu))+2.*(J.^2+(VB.*(1-mu)).*(J+J.*(1-mu)+(VB.*(1-mu)))).^(1/2));
    GG3 = @(J,mu,VB) (-1).*((-1)+(1-mu)).^(-1).*(1-mu).^2.*(J+(1+(1-mu)).*(VB.*(1-mu))).^(-2).*(J.*(1+(1-mu))+((-1)+(1-mu).*(2+(1-mu))).*(VB.*(1-mu))+(-2).*(J.^2+(VB.*(1-mu)).*(J+J.*(1-mu)+(VB.*(1-mu)))).^(1/2));
    GG4 = @(J,mu,VB) (1-mu).^2.*(J+(-1).*(1+(1-mu)).*(VB.*(1-mu))+2.*((-1).*J.*(1+(1-mu)).*(VB.*(1-mu))).^(1/2)).^(-1);
    GG5 = @(J,mu,VB) (1-mu).^2.*(J+(-1).*(1+(1-mu)).*(VB.*(1-mu))+(-2).*((-1).*J.*(1+(1-mu)).*(VB.*(1-mu))).^(1/2)).^(-1);

    G = { GG1(par.J,par.mu,par.VB), GG2(par.J,par.mu,par.VB), GG3(par.J,par.mu,par.VB), GG4(par.J,par.mu,par.VB), GG5(par.J,par.mu,par.VB) };
    k = [];
    for i = 1:numel(G)
        ind = (imag(G{i}) ~= 0) | isinf(G{i});
        G{i}(ind) = NaN;
        if all(isnan(G{i}(:)))
            k(end+1) = i;
        end
    end
    G(k) = [];
    G = eliminateEqualCurves(G);
end

function G = eliminateEqualCurves(G)
    n = numel(G);
    k = [];
    for i = 1:n
        for j = (i+1):n
            if isEqualCurve(G{i},G{j})
                k(end+1) = j;
            end
        end
    end
    G(k) = [];
end

function r = isEqualCurve(G1,G2)
    r = false;
    if (numel(G1) == numel(G2))
        r = all( abs(G1 - G2) < 1e-10 );
    end
end
