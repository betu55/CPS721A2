% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: 
%%%%% NAME:
%%%%% NAME:
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the already included comment lines below
%

%%%%% SECTION: listShift
%%%%% Put your rules for listShift and any helper predicates below

listShift(nil, _, nil).
listShift(List, 0, List).
listShift(List, V, Result) :- list_length(List, Length), V1 is V mod Length, shift_n_times(List, V1, Result).

shift_n_times(List, 0, List).
shift_n_times(List, V, Result) :- shift_once(List, NewList), V1 is V - 1, shift_n_times(NewList, V1, Result).

shift_once(nil, nil).
shift_once(next(Head, nil), next(Head, nil)).
shift_once(next(Head, Tail), Result) :- my_append(Tail, next(Head, nil), Result).

my_append(nil, List, List).
my_append(next(Head, Tail), List, next(Head, Result)) :- my_append(Tail, List, Result).

% finding the length of our list
list_length(nil, 0).
list_length(next(_, Tail), Length) :- list_length(Tail, SubLength), Length is SubLength + 1.