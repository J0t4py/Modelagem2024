% Definir parâmetros da matriz
J1 = 1.6 * 10^4;  % Momento de inércia 1
J2 = 3 * 10^4;    % Momento de inércia 2
J3 = 35 * 10^4;   % Momento de inércia 3
g = 1 * 10^3;     % Momento de inércia adicional
b12 = 1 * 10^4;   % Amortecimento entre 1 e 2
b23 = 1 * 10^4;   % Amortecimento entre 2 e 3
k12 = 60 * 10^5;  % Rigidez entre 1 e 2
k23 = 60 * 10^5;  % Rigidez entre 2 e 3
mu = 1 * 10^4;    % Coeficiente não linear

% Definir a matriz A
A = [
    0, 0, 0, 1, 0, 0;
    0, 0, 0, 0, 1, 0;
    0, 0, 0, 0, 0, 1;
    -k12/J1, k12/J1, 0, -mu/J1, mu/J1, 0;
    k12/(J2 + g), -(k12 + k23)/(J2 + g), k23/(J2 + g), mu/(J2 + g), -(mu + b23)/(J2 + g), (mu + b23)/(J2 + g);
    0, k23/J3, -k23/J3, 0, b23/J3, -b23/J3
];

% Definir a matriz B
B = [
    0;
    0;
    0;
    1;
    0;
    0
];

% Definir a matriz C
C = [0, 0, 0, 0, 0, 1];

% Definir a matriz D
D = 0;

% Calcular a função de transferência usando a função ss2tf
[num, den] = ss2tf(A, B, C, D);

% Criar o sistema de controle
sys = tf(num, den);

% Plotar o diagrama de Bode
bode(sys);
grid on;
title('Diagrama de Bode');
