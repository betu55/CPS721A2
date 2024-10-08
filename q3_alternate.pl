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

% initial call to alternatePlusMinusHelper
alternatePlusMinus(List, Result) :- alternatePlusMinusHelper(List, Result, plus).

alternatePlusMinusHelper([], 0, _).

alternatePlusMinusHelper([Head|Tail], Result, plus) :- alternatePlusMinusHelper(Tail, SubResult, minus), Result is Head + SubResult.

alternatePlusMinusHelper([Head|Tail], Result, minus) :- alternatePlusMinusHelper(Tail, SubResult1, plus), Result is SubResult1 - Head.
