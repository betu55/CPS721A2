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

%%%%% SECTION: nestedLists
%%%%% Put your rules for nestedFindDepth, nestedFindIndex, and any helper predicates below

nestedFindDepth(List, Item, 0):- List == Item.
nestedFindDepth([H | T], Item, 0):- H == Item.
nestedFindDepth([H | T], Item, Depth):- is_list(H), nestedFindDepth(H, Item, D1), Depth is D1 + 1.
nestedFindDepth([H | T], Item, Depth):- nestedFindDepth(T, Item, Depth).

nestedFindIndex(List, Item, 0, 0):- List == Item.
nestedFindIndex([H | T], Item, 0, 0):- H == Item.
nestedFindIndex([H | T], Item, Depth, Index):- is_list(H), nestedFindDepth(H, Item, D1), Depth is D1 + 1, nestedFindIndex(T, Item, Depth, Index).
nestedFindDepth([H | T], Item, Depth, Index):- nestedFindIndex(T, Item, Depth, I1), Index is I1 + 1.
