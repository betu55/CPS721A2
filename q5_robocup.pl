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
%%%%% Below you can find the KB given in the assignment PDF. You may edit it as you wish for testing
%%%%% It will be ignored in the tests
%%%%% Do not put any part of the KB in the robocup section below. That section, should only
%%%%% have statements for the canPass, canScore, and any helper predicates needed for computing those
robot(r1).     robot(r2).     robot(r3).
robot(r4).     robot(r5).     robot(r6).
hasBall(r3).
pathClear(r1, net).    pathClear(r2, r1).    pathClear(r3, r2).
pathClear(r3, net).    pathClear(r3, r1).    pathClear(r3, r4).
pathClear(r4, net).    pathClear(r1, r5).    pathClear(r5, r6).

%%%%% SECTION: robocup
%%%%% Put your rules for canPass, canScore, and any helper predicates below

lMember(X, [X | Tail]).
lMember(X, [Head | Tail]) :- member(X,Tail).

validPass(R1, R2):- robot(R1), robot(R2), not R1 = R2, pathClear(R1, R2).
validPass(R1, R2):- robot(R1), robot(R2), not R1 = R2, pathClear(R2, R1).

myappend([ ],List,List).
myappend([X | List1], List2,[X | Result]) :- append(List1,List2,Result).

canPass(R1, R2, M, [R1, R2]):- validPass(R1, R2), M >= 1.
canPass(R1, R2, M, [R1 | [A1 | B1]]):- validPass(R1, R3), not R1 = R2, M >= 2, M1 is M-1, M1 >= 1, canPass(R3, R2, M1, [A1 | B1]), not lMember(R3, B1), not lMember(R1, B1).

canScore(R, M, [R, net]):- hasBall(R), M >= 1, pathClear(R, net).
canScore(R, M, Path):- hasBall(R1), M >= 2, M1 is M - 1, M1 >= 1, canPass(R1, R, M1, [A2 | B2]), not lMember(R1, B2), pathClear(R, net), myappend([A2 | B2], [net], Path).
