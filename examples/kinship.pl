:- use_module('../metagol').

metagol:max_clauses(7).

%% preds that metagol can use in the body of a clause
body_pred(mother/2).
body_pred(father/2).

%% metarules
metarule([P,Q], [P,A,B], [[Q,A,B]]).
metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).

%% background knowledge
mother(b,c).
mother(e,f).
mother(i,l).
mother(k,m).
mother(f,g).
mother(m,n).
mother(n,o).
father(g,o).
father(a,c).
father(d,f).
father(h,l).
father(j,m).
father(l,n).
father(c,g).


%% learn grandparent by inventing parent
a:-
  Pos = [
    grandgrandparent(a,o),
    grandgrandparent(b,o),
    grandgrandparent(d,o),
    grandgrandparent(e,o),
    grandgrandparent(h,o),
    grandgrandparent(i,o),
    grandgrandparent(j,o),
    grandgrandparent(k,o)
  ],
  Neg = [],

  learn(Pos,Neg).

%% example of a failure
b :-
  Pos = [grandparent(ann,amelia)],
  Neg = [grandparent(ann,amelia)],
  (learn(Pos,Neg) -> false; writeln('failed to learn a theory')).

%% :-
  %% time(a).