T { teammember(C) : champion(C) } T :- T = teamsize.
0{ spatula(C,T) : teammember(C), spatulabonus(T) }3.

trait(C,T) :- spatula(C,T).

traitcount(T, N) :- trait(T), N=#count{ C: trait(C, T), teammember(C) }, N>0.
activebonus(T, N, M) :- traitbonus(T, N), traitcount(T, M), M >= N.
activebonus(T, N) :- activebonus(T, N, M).
inactivebonus(T, N, M) :- traitbonus(T,N), traitcount(T,M), M > 0, M < N.
inactivebonus(T, N) :- inactivebonus(T,N,M).

:- 0=#count{ T : activebonus(T,N,M) }.
:- activebonus(ninja, N, M), M > 1, M < 4.

:- desiredtrait(T,N), not activebonus(T,N).

#minimize { 1,C,T : spatula(C,T) }.
#maximize { 1,T,N : activebonus(T,N) }.

#show teammember/1.
#show spatula/2.
#show activebonus/3.
#show inactivebonus/3.
