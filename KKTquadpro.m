function [xvec,yvec] = KKTquadpro(G,A,c,b)
nullA = null(A);
errvec = 0;
a = size(A);
% check coercivity condition
for k = 1:size(null(A));
    if (nullA(k)'*G*nullA(k) < 0);
        errvec = errvec+1
    end
end
if (errvec == 0)&&(rank(A)==a(1));
    
    K = [G A';A zeros(a(1),a(1))];
    sol = [-c;b];
    vals=K\sol;
    xsol = vals(1:size(c))
    lambsol = vals(1+size(c):end)
elseif(errvec ~= 0);
    sprintf('There is a vector in the null space of A that is not orthogonal to G -- no unique solution.')
elseif(rank(A)~=a(1));
    sprintf('A is singular')
end
