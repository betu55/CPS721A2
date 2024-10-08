% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Michael AbdElsayed
%%%%% NAME: Bemenet Bekele
%%%%% NAME: Subha Tasnim
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the already included comment lines below
%

%%%%% SECTION: nestedLists
%%%%% Put your rules for nestedFindDepth, nestedFindIndex, and any helper predicates below

nestedFindDepth(List, Item, Depth) :-
    nestedFindDepth(List, Item, 0, Depth).

% Base case: if the item matches and its not a list, return the current depth.
nestedFindDepth(Item, Item, Depth, Depth) :-
    \+ is_list(Item).

% search the head of the list.
nestedFindDepth([Head|Tail], Item, CurrentDepth, Depth) :-
    (nestedFindDepth(Head, Item, CurrentDepth, Depth) ;
    nestedFindDepth(Tail, Item, CurrentDepth, Depth)).

% if the current element is a list, increment the depth and continue search.
nestedFindDepth(List, Item, CurrentDepth, Depth) :-
    is_list(List),
    NextDepth is CurrentDepth + 1,
    nestedFindDepth(List, Item, NextDepth, Depth).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nestedFindIndex(List, Item, Depth, Index) :-
    nestedFindIndex(List, Item, 0, Depth, 0, Index).

% Base case: if the item matches and its not a list, return the current depth and index.
nestedFindIndex(Item, Item, Depth, Depth, Index, Index) :-
    \+ is_list(Item).

% search the head of the list and keep track of the index.
nestedFindIndex([Head|Tail], Item, CurrentDepth, Depth, CurrentIndex, Index) :-
    nestedFindIndex(Head, Item, CurrentDepth, Depth, CurrentIndex, Index).
nestedFindIndex([_|Tail], Item, CurrentDepth, Depth, CurrentIndex, Index) :-
    NextIndex is CurrentIndex + 1,
    nestedFindIndex(Tail, Item, CurrentDepth, Depth, NextIndex, Index).

% if the current element is a list, increment the depth and continue searching.
nestedFindIndex(List, Item, CurrentDepth, Depth, Index, Index) :-
    is_list(List),
    NextDepth is CurrentDepth + 1,
    nestedFindIndex(List, Item, NextDepth, Depth, Index, Index).