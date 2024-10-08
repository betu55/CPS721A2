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

%%%%% SECTION: alternatePlusMinus
%%%%% Put your rules for alternatePlusMinus and any helper predicates below

alternatePlusMinus([], 0).

% initial call to helper predicate
alternatePlusMinus([Head|Tail], Result) :- alternateSigns(Tail, NewSubList, plus), sum_list([Head|NewSubList], Result).

% here we are making a new list with the elements of the original lists tail but with alternating signs. We will use this later with the sum_list predicate to find the sum.
alternateSigns([], [], _).
alternateSigns([Head|Tail], [NewHead|NewTail], plus) :- NewHead is Head, alternateSigns(Tail, NewTail, minus).
alternateSigns([Head|Tail], [NewHead|NewTail], minus) :- NewHead is -Head, alternateSigns(Tail, NewTail, plus).

sum_list([], 0).
sum_list([Head|Tail], Result) :- sum_list(Tail, SubResult), Result is Head + SubResult.

