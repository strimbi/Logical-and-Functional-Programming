%3.a
%
%Mathematical model:
%delrep(el,l1..ln) =
%  [], if n=0
%  l1 + delRep(el,l1...ln), if el!=l1
%  delRep(el,l1..ln), if el=l1

%delrep(E,X,R)
%t-list
%x-element
%r-result list
%(i,i,o)

delrep([], _, []).
delrep([H|T], X, R) :-
    H == X,
    delrep(T, X, R).
delrep([H|T], X, [H|R]) :-
    H \= X,
    delrep(T, X, R).


% Mathematical model:
% multime(l1...ln) =
%	[], n = 0
%	l1 + multime(delrep(l2...ln, l1)), n\=0

% multime(L:list, R:list)
% flux model (i, o)

multime([], []).
multime([H|T], [H|R]) :-
    delrep(T, H, R1),
    multime(R1, R).


%3.b
%
%Mathematical model:
%descompunere(l1...ln)=
%   [0,0,[],[]], if n=0
%   {descompunere(l2..ln), 1+ nr_par, l1 + list_par}, l1%2=0
%   {descompunere(l2..ln), 1+ nr_impar, l1 + list_impar}, l1%2=1
%
% descompunere(L,R)
% L-initial list
% R-result list
% flux model(i,o)

descompunere([],[0,0,[],[]]).
descompunere([E|X],[N1s,N2,[E|Y1],Y2]):-
    E mod 2 =:= 0,
    descompunere(X,[N1,N2,Y1,Y2]),
       N1s is N1+1.
descompunere([E|X],[N1,N2s,Y1,[E|Y2]]):-
    E mod 2 =:= 1,
    descompunere(X,[N1,N2,Y1,Y2]),
       N2s is N2+1.
