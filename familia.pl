% Hechos sobre g�nero
es_hombre(juan).
es_hombre(pedro).
es_hombre(jesus).
es_hombre(kain).
es_hombre(isaac).
es_hombre(samson).
es_hombre(abel).

es_mujer(maria).
es_mujer(andrea).
es_mujer(ana).
es_mujer(sofia).

% Hechos sobre matrimonio
es_conyuge_de(juan, maria).
es_conyuge_de(maria, juan).
es_conyuge_de(jesus, sofia).
es_conyuge_de(sofia, jesus).
es_conyuge_de(kain, ana).
es_conyuge_de(ana, kain).

% Hechos sobre progenitores
es_progenitor_de(juan, pedro).
es_progenitor_de(maria, pedro).
es_progenitor_de(juan, andrea).
es_progenitor_de(maria, andrea).
es_progenitor_de(juan, jesus).

es_progenitor_de(andrea, ana).

es_progenitor_de(kain, isaac).
es_progenitor_de(kain, samson).

es_progenitor_de(jesus, abel).
es_progenitor_de(sofia, abel).


% Reglas para identificar esposa y esposo
es_esposa_de(X, Y) :- es_mujer(X), es_conyuge_de(X, Y).
es_esposo_de(X, Y) :- es_hombre(X), es_conyuge_de(X, Y).

% Reglas para identificar padre y madre
es_padre_de(X, Y) :- es_hombre(X), es_progenitor_de(X, Y).
es_madre_de(X, Y) :- es_mujer(X), es_progenitor_de(X, Y).

% Reglas para identificar abuelos y abuelas
es_abuelo_de(X, Y) :- es_hombre(X), es_progenitor_de(X, Z), es_progenitor_de(Z, Y).
es_abuela_de(X, Y) :- es_mujer(X), es_progenitor_de(X, Z), es_progenitor_de(Z, Y).

% Reglas para identificar primos y primas
es_primo_de(X, Y) :- es_hombre(X), es_progenitor_de(A, X), es_progenitor_de(B, Y), es_hermano_de(A, B).
es_prima_de(X, Y) :- es_mujer(X), es_progenitor_de(A, X), es_progenitor_de(B, Y), es_hermano_de(A, B).

% Reglas para identificar hermanos y hermanas

es_hermano_de(X, Y) :- es_hombre(X), es_progenitor_de(Z, X), es_progenitor_de(Z, Y), X \= Y.
es_hermana_de(X, Y) :- es_mujer(X), es_progenitor_de(Z, X), es_progenitor_de(Z, Y), X \= Y.

% Regla para identificar ancestros
es_ancestro_de(X, Y) :- es_progenitor_de(X, Y).
es_ancestro_de(X, Y) :- es_progenitor_de(X, Z), es_ancestro_de(Z, Y).

% Regla para identificar descendientes
es_descendiente_de(X, Y) :- es_progenitor_de(Y, X).
es_descendiente_de(X, Y) :- es_progenitor_de(Z, X), es_descendiente_de(Z, Y).