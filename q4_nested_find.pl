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

nestedFindDepth([Item|T], Item, 0).
nestedFindDepth([I|Tail], Item, Depth) :- nestedFindDepth(Tail, Item, Depth).

nestedFindDepth(List, Item, Depth) :- nestedFindDepthHelper(List, Item, 0, Depth).
nestedFindDepthHelper([], I, CD, D) :- fail.

nestedFindDepthHelper([Head|Tail], Item, CurrentDepth, Depth) :-
    is_list(Head),
    NextDepth is CurrentDepth + 1,
    nestedFindDepthHelper(Head, Item, NextDepth, Depth).

nestedFindDepthHelper([Head|Tail], Item, CurrentDepth, Depth) :-
    is_list(Head),
    nestedFindDepthHelper(Tail, Item, CurrentDepth, Depth).

nestedFindDepthHelper([Head|Tail], Item, CurrentDepth, Depth) :-
    not(is_list(Head)),
    Head = Item,
    Depth = CurrentDepth.

nestedFindDepthHelper([Head|Tail], Item, CurrentDepth, Depth) :-
    not(is_list(Head)),
    nestedFindDepthHelper(Tail, Item, CurrentDepth, Depth).

nestedFindIndex([Item|T], Item, 0, 0).
nestedFindIndex([I|Tail], Item, Depth, Index) :-
    nestedFindIndex(Tail, Item, Depth, NextIndex),
    Index is NextIndex + 1.


nestedFindIndex(List, Item, Depth, Index) :-
    nestedFindIndexHelper(List, Item, 0, 0, Depth, Index).

nestedFindIndexHelper([], I, CD, CI, D, I) :- fail.
nestedFindIndexHelper([Head|Tail], Item, CurrentDepth, CurrentIndex, Depth, Index) :-
    is_list(Head),
    NextDepth is CurrentDepth + 1,
    nestedFindIndexHelper(Head, Item, NextDepth, CurrentIndex, Depth, Index).

nestedFindIndexHelper([Head|Tail], Item, CurrentDepth, CurrentIndex, Depth, Index) :-
    is_list(Head),
    NextIndex is CurrentIndex + 1,
    nestedFindIndexHelper(Tail, Item, CurrentDepth, NextIndex, Depth, Index).

nestedFindIndexHelper([Head|Tail], Item, CurrentDepth, CurrentIndex, Depth, Index) :-
    not(is_list(Head)),
    Head = Item,
    Depth = CurrentDepth,
    Index = CurrentIndex.

nestedFindIndexHelper([Head|Tail], Item, CurrentDepth, CurrentIndex, Depth, Index) :-
    not(is_list(Head)),
    NextIndex is CurrentIndex + 1,
    nestedFindIndexHelper(Tail, Item, CurrentDepth, NextIndex, Depth, Index).