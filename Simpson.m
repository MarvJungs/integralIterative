%Berechnet die summierte Simpsonregel
%Aufruf mit Simpson(f, a, b, n)
%Parameter:
% f - Integrand als function handle
% a - linke Intervallgrenze
% b - rechte Intervallgrenze
% n - Anzahl der Teilintervalle (optional, default: n=10)
% Autor: Karin Lunde
function Q = Simpson (f, a, b, n)
if (nargin == 3) 
    n = 10;
end

h = (b-a) / n;            % Schrittweite des Verfahrens

% Initialisierung
sum = f(a) + f(b);        % Summe der Funktionswerte an Intervallenden
sum1 = 0;                 % Summe der Funktionswerten in den Teilintervallgrenzen
sum2 = f(a + 0.5*h);      % Summe der Funktionswerten in den Teilintervallmitten

for k=1:n-1
    sum1 = sum1 + f(a + k*h);
    sum2 = sum2 + f(a + (k+0.5)*h);
end

Q = h / 6 * (sum + 2 * sum1 + 4 * sum2);

% Formatierte Ausgabe im Kommandofenster
 fprintf('Näherungswert mit %d Stützstellen: Q = %f\n', n, Q);