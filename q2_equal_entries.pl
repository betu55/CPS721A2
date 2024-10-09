% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Subha Tasnim
%%%%% NAME: Bemenet Bekele
%%%%% NAME: Michael Abd Elsayed
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the already included comment lines below
%

%%%%% SECTION: equalEntries
%%%%% Put your rules for equalEntries below

len([], 0).
len([H|T], N):- len(T, N1), N is N1+1.

equalEntries([], [], []).
equalEntries([H1|T1], [H2|T2], [true| EqI]):- len([H1|T1], L1), len([H2|T2], L2), L1 = L2, H1==H2, equalEntries(T1, T2, EqI).
equalEntries([H1|T1], [H2|T2], [false| EqI]):- len([H1|T1], L1), len([H2|T2], L2), L1 = L2, not(H1==H2), equalEntries(T1, T2, EqI).
