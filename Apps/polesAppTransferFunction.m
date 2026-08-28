function [tfObj,Fsym,Fnum,Fdenom] = polesAppTransferFunction(pz,nPoles,nZeros,gain)
%POLESAPPTRANSFERFUNCTION Build the transfer function used by polesApp.

arguments
    pz (1,:) {mustBeNumeric}
    nPoles (1,1) {mustBeInteger,mustBeNonnegative}
    nZeros (1,1) {mustBeInteger,mustBeNonnegative}
    gain (1,1) {mustBeNumeric}
end

% Validate minimal pole/zero vector length
if numel(pz) < 6
    error("polesAppTransferFunction:NotEnoughPoleZeroValues", ...
        "Expected at least six pole and zero values.");
end

% Validate max number of pole/zero pairs
if nPoles > 3 || nZeros > 3
    error("polesAppTransferFunction:TooManyPoleZeroValues", ...
        "Expected at most three pole pairs and three zero pairs.");
end

% Use symbolic s for polynomial construction
syms s

% Build numerator from zero locations
FnumBase = sym(1);
for idx = 4:(3 + nZeros)
    FnumBase = FnumBase*localFactor(s,pz(idx));
end

% Build denominator from pole locations
Fdenom = sym(1);
for idx = 1:nPoles
    Fdenom = Fdenom*localFactor(s,pz(idx));
end

numAtZero = double(subs(FnumBase,s,0));
denomAtZero = double(subs(Fdenom,s,0));

% Scale numerator to match DC gain when possible
if abs(numAtZero) > eps && abs(denomAtZero) > eps
    numeratorScale = gain*denomAtZero/numAtZero;
else
    numeratorScale = gain;
end

Fnum = expand(FnumBase*numeratorScale);
Fdenom = expand(Fdenom);
Fsym = sym(Fnum/Fdenom);

% Convert symbolic polynomials to numeric coefficient vectors
cnum = localRealIfClose(sym2poly(Fnum));
cdenom = localRealIfClose(sym2poly(Fdenom));

% Create MATLAB transfer-function model
tfObj = tf(cnum,cdenom);
end

function factor = localFactor(s,rootLocation)
% Create linear factor; conjugate-pair for complex roots
if imag(rootLocation) == 0
    factor = s - rootLocation;
else
    factor = expand((s - rootLocation)*(s - conj(rootLocation)));
end
end

function value = localRealIfClose(value)
% Drop tiny imaginary parts from coefficients if numerically negligible
if max(abs(imag(value)),[],"all") < 100*eps
    value = real(value);
end
end