enemigo(rusia, ucrania).
enemigo(ucrania, rusia).
enemigo(rusia, usa).
enemigo(usa, rusia).
%enemigo(japon, koreaNorte).
enemigo(rusia, japon).
enemigo(japon, rusia).
enemigo(usa, china).
enemigo(china, usa).
enemigo(usa, cuba).
enemigo(cuba, usa).
enemigo(usa, iran).
enemigo(iran, usa).

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



%2.
escribir_letra(N):-
    N =< 0,
    write("Debe ingresar un numero mayor a 0"),
    !, fail.

escribir_letra(N):-
    write("Digite la letra a repetir"),
    read(L),
    escribir(N, L).


escribir_letra(_, L):-
    \+ atom(L),
    writeln("Debe escribir una letra"),
    !, fail.


escribir(0, _) :- !.


escribir(N, L):-
    N > 0,
    writeln(L),
    N1 is N - 1,
    escribir(N1, L).


%Ej. 3 Grafos

conexion(a, b, 4).
conexion(a, c, 2).
conexion(b, c, 8).
conexion(b, e, 9).
conexion(b, d, 7).
conexion(c, d, 5).
conexion(c, e, 3).
conexion(d, f, 6).
conexion(e, f, 1).

camino(Inicio, Final, Peso):-
    conexion(Inicio, Final, Peso), !.

camino(Inicio, Final, Peso):-
    conexion(Inicio, Intermedio, P1),
    camino(Intermedio, Final, P2),
    Peso is P1 + P2.

%ej. Euclides
euclides(N, 0, N):- !.

euclides(N, M, X):-
    R is N mod M,
    euclides(M, R, X).

%Ej.5
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

comida_equilibrada(X, Y, Z):-
    valor_calorico(X, Y, Z, V),
    V =< 800,
    writeln("La comida es saludable").

comida_equilibrada(X, Y, Z):-
    valor_calorico(X,Y, Z, V),
    V > 800,
    writeln("La comida no es saludable").






















