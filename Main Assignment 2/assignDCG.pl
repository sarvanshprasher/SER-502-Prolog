% @author : Sarvansh Prasher
% @version 1.0
% @created on 03-19-2020

% Predicates used :

% "program" predicate will be the main function of any programming language which contains
% the statements and is executable.

% "block" predicate will be containing all the declarations and commands
% and all the things which are necessary before starting any program.

% "declaration" predicate will be containing all the constant and variable declarations and later use them in block.

% "command" predicate will be containing all the commands such as if else,do while loop
% in which we will use the variables and doing operations inside them.

% "booleanExpression" predicate will be containing all the commands such as true,false,
% using which we will determine if any variable is equal or not.

% "arithmeticExpression" predicate will be containing all the commands such as subtraction operation.

% "additionOperation" predicate will be containing all the commands such as addition operation.

% "multiplicationOperation" predicate will be containing all the commands such as multiplication operation.

% "divisionOperation" predicate will be containing all the commands such as division operation.

% "generalOperation" predicate will be containing all the general commands using which we will assign values to variables.

% "identifier" predicate will be used for defining identifiers used in block.

% "number" predicate will be used for numbers used in block.

% --------------------------------------*******---------------------------------

% Solution 1 for eliminating left recursion

program --> block,[.].

block --> [begin],declaration,[;],command,[end].

declaration --> [const],identifier,[=],number,[;],declaration|
    [var],identifier,[;],declaration|
    [const],identifier,[=],number|
    [var],identifier.

command --> identifier,[:=],arithmeticExpression,[;],command|
[if],booleanExpression,[then],command,[else],command,[endif],[;],command|
[while],booleanExpression,[do],command,[endwhile],[;],command|
block,[;],command| identifier,[:=],arithmeticExpression|
[if],booleanExpression,[then],command,[else],command,[endif]|
[while],booleanExpression,[do],command,[endwhile]|block.

booleanExpression -->[true]|[false]|arithmeticExpression,[=],arithmeticExpression|
    [not],booleanExpression.

arithmeticExpression --> additionOperation,arithmeticExpression1.
arithmeticExpression1 --> [-],additionOperation,arithmeticExpression1|[].

additionOperation --> multiplicationOperation,additionOperation1.
additionOperation1 --> [+],multiplicationOperation,additionOperation1|[].

multiplicationOperation --> divisionOperation,multiplicationOperation1.
multiplicationOperation1 --> [*],divisionOperation,multiplicationOperation1|[].

divisionOperation --> generalOperation,divisionOperation1.
divisionOperation1 --> [/],generalOperation,divisionOperation1|[].

generalOperation --> identifier|number.

identifier --> [x]|[y]|[z]|[u]|[v].

number --> [0]|[1]|[2]|[3]|[4]|[5]|[6]|[7]|[8]|[9].

% --------------------------------------*******---------------------------------

% Solution 2 for displaying parse tree using DCG.

:- use_rendering(svgtree).

program(p(Z)) --> block(Z),[.].

block(b(Z,Z1)) --> [begin],declaration(Z),[;],command(Z1),[end].

declaration(d(Z,Z1,Z2)) --> [const],identifier(Z),[=],number(Z1),[;],declaration(Z2).
declaration(d(Z,Z1)) --> [var],identifier(Z),[;],declaration(Z1).
declaration(d(Z,Z1)) --> [const],identifier(Z),[=],number(Z1).
declaration(d(Z)) --> [var],identifier(Z).

command(c(Z,Z1,Z2)) --> identifier(Z),[:=],arithmeticExpression(Z1),[;],command(Z2).
command(c(Z,Z1,Z2,Z3)) --> [if],booleanExpression(Z),[then],command(Z1),[else],command(Z2),[endif],[;],command(Z3).
command(c(Z,Z1,Z2)) --> [while],booleanExpression(Z),[do],command(Z1),[endwhile],[;],command(Z2).
command(c(Z,Z1)) --> block(Z),[;],command(Z1).
command(c(Z,Z1)) --> identifier(Z),[:=],arithmeticExpression(Z1).
command(c(Z,Z1,Z2)) --> [if],booleanExpression(Z),[then],command(Z1),[else],command(Z2),[endif].
command(c(Z,Z1,Z2)) --> [while],booleanExpression(Z),[do],command(Z1),[endwhile]|block(Z2).

booleanExpression(bo(true)) --> [true].
booleanExpression(bo(false)) --> [false].
booleanExpression(bo(Z,Z1)) --> arithmeticExpression(Z),[=],arithmeticExpression(Z1).
booleanExpression(bo(Z)) --> [not],booleanExpression(Z).

arithmeticExpression(ae(Z,Z1)) --> additionOperation(Z),arithmeticExpression1(Z1).
arithmeticExpression1(ae1(Z,Z1)) --> [-],additionOperation(Z),arithmeticExpression1(Z1)|[].

additionOperation(ao(Z,Z1)) --> multiplicationOperation(Z),additionOperation1(Z1).
additionOperation1(ao1(Z,Z1)) --> [+],multiplicationOperation(Z),additionOperation1(Z1)|[].

multiplicationOperation(mo(Z,Z1)) --> divisionOperation(Z),multiplicationOperation1(Z1).
multiplicationOperation1(mo1(Z,Z1)) --> [*],divisionOperation(Z),multiplicationOperation1(Z1)|[].

divisionOperation(do(Z,Z1)) --> generalOperation(Z),divisionOperation1(Z1).
divisionOperation1(do1(Z,Z1)) --> [/],generalOperation(Z),divisionOperation1(Z1)|[].

generalOperation(go(Z)) --> identifier(Z).
generalOperation(go(Z)) --> number(Z).

identifier(id(x)) --> [x].
identifier(id(y)) --> [y].
identifier(id(z)) --> [z].
identifier(id(u)) --> [u].
identifier(id(v)) --> [v].

number(number_digit(0)) --> [0].
number(number_digit(1)) --> [1].
number(number_digit(2)) --> [2].
number(number_digit(3)) --> [3].
number(number_digit(4)) --> [4].
number(number_digit(5)) --> [5].
number(number_digit(6)) --> [6].
number(number_digit(7)) --> [7].
number(number_digit(8)) --> [8].
number(number_digit(9)) --> [9].
