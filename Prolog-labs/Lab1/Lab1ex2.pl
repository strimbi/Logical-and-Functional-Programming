%adauga([],N,N,V,[V]).
adauga([],_,_,_,[]).
adauga([H|L],P,N,V,[H|R]):-
    P=\=N,
    P1 is P+1,
    adauga(L,P1,N,V,R).
adauga([H|L],P,N,V,[H,V|R]):-
    P=:=N,
    P1 is P+1,
    N1 is N*2,
    adauga(L,P1,N1,V,R).

mainadauga(L,V,R):-
    adauga(L,1,1,V,R).

%!  a

cmdc(A,0,A):-!.
cmdc(0,B,B):-!.
cmdc(A,B,R):-
    A>=B,
    A1 is A mod B,
    cmdc(A1,B,R).
cmdc(A,B,R):-
    A<B,
    B1 is B mod A,
    cmdc(A,B1,R).

%cmmmc = a*b/cmmdc(a,b)

cmc(A,B,R):-
    cmdc(A,B,R1),
    R is A*B/R1.

maincmc([],0).
maincmc([H],H).
maincmc([H|T],R):-
    maincmc(T,R1),
    cmc(H,R1,R).

