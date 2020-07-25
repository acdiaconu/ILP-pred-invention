:-['../metagol'].

%% background knowledge
add_one(A,B):-
  integer(A),
  succ(A,B).

%% metarules
metarule(ident, [P,Q], [P,A,B], [[Q,A,B]]).
metarule(precon, [P,Q,R], [P,A,B], [[Q,A,B],[R,A]]).
metarule(postcon, [P,Q,R], [P,A,B], [[Q,A,B],[R,B]]).
metarule(chain, [P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).

%% allow metagol to use my_succ in the body of a clause
body_pred(add_one/2).

%% interpreted BK
ibk().

a:-
    Pos = [
        f(1,6),
        f(5,10)
    ],
    learn(Pos,[]).
:-
    time(a).