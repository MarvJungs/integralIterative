% Calculates the value of an Integral with the Simpsonsrule
% Call with integralIterative(f, a, b, eps)
% Parameter:
% f: the function as a function handle
% a and b are the bounds of the Intervall you want to integrate
% eps describes how precise the result should be (if not given, 10^-6  is default

function ret = integralIterative(f, a, b, eps)
    if nargin == 3
        eps = 10e-6;
    elseif nargin < 3
        error("Amount of given arguments doesn't fit!");
    end
    
    if eps < 0
        error("eps cannot be negative!")
    end
    
    n = 1;
    
    %Step 1:
    Qn = Simpson(f,a,b,n);
    
    while true
        
        %Step 2
        Q2n = Simpson(f,a,b,2*n);
        
        %Step 3
        R2n = (Q2n - Qn) / 15;
        n = 2 * n;
        if abs(R2n) < eps
            break;
        end
        Qn = Q2n;
    end
    
%    version without break
%    Q2n = eps + 1;% = Simpson(f,a,b,2*n);
%    R2n = eps + 1;%; = (Q2n - Qn) / 15;
    
%    while abs(R2n) > eps
        %Step 2:
%        Q2n = Simpson(f,a,b,2*n);
    
        %Step 3:
%        R2n = (Q2n - Qn)/ 15;
        
%        n = 2 * n;
        
%        Qn = Q2n;
    fprintf('Verwendete Teilintervalle: %d\n', n);
    fprintf('Fehlerabschätzung: %e\n', R2n);
    ret = Q2n;
end