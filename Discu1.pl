%Ej.1

%Dado un ejercicio como argumento un numero N,
%Elabore una clausula recursiva que imprima
%en pantalla un letra
%
%
escribir_letra(N):-
    N =< 0,
    writeln("Debe ingresar un numero mayor a 0."),
    !, fail.

escribir_letra(N):-
    write("Digite la letra a repetir: "),
    read(L),
    escribir(N, L).

escribir(_, L):-
    \+ atom(L),
    write("Debe digitar una letra"),
    !, fail.

escribir(0, _):- !.

escribir(N, L):-
    N > 0,
    writeln(L),
    N1 is N - 1,
    escribir(N1, L).


%Ejercicio 2
%Restaurante
%
calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filete, 400).
calorias(pollo, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces, 500).
calorias(naranja, 50).

valor_calorico(X, Y, Z, V):-
    calorias(X, A),
    calorias(Y, B),
    calorias(Z, C),
    V is A + B + C.

valor_calorico(X, Y, Z):-
    valor_calorico(X, Y, Z, V),
    V=<800,
    writeln("La comida es equilibrada").

valor_calorico(X, Y, Z):-
    valor_calorico(X, Y, Z, V),
    V > 800,
    writeln("La comida es mala :(, tiene mas de 800 cal").


%Ej.3 El enemigo de mi enemigo es mi amigo

enemigo(rusia, ucrania).
enemigo(ucrania, rusia).
enemigo(rusia, japon).
enemigo(japon, rusia).
enemigo(usa, rusia).
enemigo(rusia, usa).
enemigo(china, usa).
enemigo(usa, china).
enemigo(usa, cuba).
enemigo(cuba, usa).


no_enemigo(X, Y):-
    not(enemigo(X, Y)),
    not(enemigo(Y, X)).

aliado(X, Y, Z):-
    no_enemigo(X, Y),
    no_enemigo(X, Z),
    no_enemigo(Y, Z),
    dif(X, Y),
    dif(X, Z),
    dif(Y, Z).


%Ej.4
% clausula de aridad 2
% parametro 1: numero
% parametro 2: suma de digitos del numero
%
sumardigitos(N, M):-
    number(N),
    sumar(N, 0, M).


sumar(0, M, M):- !.

sumar(N, V, M):-
    N > 0,
    Res is N mod 10,
    C is N // 10,
    V1 is V + Res,
    sumar(C, V1, M).


%Ej. 5
%Grafos

conexion(a, b, 4).
conexion(a, c, 2).
conexion(b, c, 8).
conexion(b, e, 9).
conexion(b, d, 7).
conexion(c, d, 5).
conexion(c, e, 3).
%camino(Inicio, Final, Intermedio, Peso):-
    %conexion(Inicio, Intermedio, P1),
    %conexion(Intermedio, Final, P2),
    %Peso is P1+P2.
%Para probar:
%?-camino(a,b,c,Precio).
%Pre = 12
camino(Inicio, Final, Peso):-
    conexion(Inicio, Final, Peso),
    !.
camino(Inicio, Final, Peso):-
    conexion(Inicio, Intermedio, P1),
    camino(Intermedio, Final, P2),
    Peso is P1+P2.



%Ej. 6
%Pepito

% Base de conocimiento: Lista de locales
local(foodcourt).
local(zapateria_lee_shoes).
local(gradas_electricas).
local(super_selectos).
local(ferreteria_freund).
local(cinepolis).
local(la_neveria).
local(torogoz).
local(dollar_city).

% Verificación de nombre de local válido
local_valido(X) :-
    local(X).

% Verificación de que tres lugares (locales) forman un conjunto válido
puede_estar(X, Y, Z) :-
    local_valido(X),
    local_valido(Y),
    local_valido(Z),
    dif(X, Z),  % Verificar que X no sea igual a Z
    dif(Y, Z).  % Verificar que Y no sea igual a Z

%?- puede_estar(cinepolis, la_neveria, foodcourt).
%true.

%?- puede_estar(cinepolis, la_neveria, cinepolis).
%false.


%Ej. 7
% Calcular el máximo común divisor de dos numeros enteros, con el
% algoritmo de Euclides
% La división del mayor de los números entre el menor
% El residuo es cero, el mcd está en la variable que contiene el menor
% Si el residuo es 0, entonces se pasa al nuevo menor y se repite
% Predicado para calcular el máximo común divisor (MCD) usando el algoritmo de Euclides
euclides(N, 0, N) :- !.
euclides(N, M, X) :-
    R is N mod M,     % Calcular el residuo de la división entre N y M
    euclides(M, R, X). % Llamada recursiva con M y R para calcular el MCD
% PRUEBA:=> ?- euclides(100, 30, X).X = 10. Y ?- euclides(48, 18, X). X =
% 6.



%Ej. 8

% Ejercicio
% Invertir digitos, recibe valor entero, argumento y retorna
% segundo argumento,cantidad entera de los mismos digitos
% ej. 12345 -> 54321

% Predicado para invertir los dígitos de un número
invierte_digitos(N, M) :-
    number(N),
    invertir(N, 0, M).

% Verificación para cuando se llega a cero y termina
invertir(0, M, M) :- !.

% Función recursiva para invertir los dígitos
invertir(N, I, M) :-
    N > 0,
    C is N // 10,           % Obtener el número sin el dígito menos significativo
% Los operadores // y mod se usan por separado para obtener el número
% reducido y el dígito menos significativo.
    I1 is (I * 10) + N mod 10, % Construir el número invertido
    invertir(C, I1, M).     % Llamada recursiva con el número reducido
%?- invierte_digitos(12345, Resultado).Resultado = 54321.
%?- invierte_digitos(9876, Resultado).Resultado = 6789.


















