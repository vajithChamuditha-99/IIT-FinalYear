Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Maze))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Maze))==(Machine(Maze));
  Level(Machine(Maze))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Maze)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Maze))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Maze))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Maze))==(?);
  List_Includes(Machine(Maze))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Maze))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Maze))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Maze))==(?);
  Context_List_Variables(Machine(Maze))==(?);
  Abstract_List_Variables(Machine(Maze))==(?);
  Local_List_Variables(Machine(Maze))==(visitedRoute,yCurrent,xCurrent);
  List_Variables(Machine(Maze))==(visitedRoute,yCurrent,xCurrent);
  External_List_Variables(Machine(Maze))==(visitedRoute,yCurrent,xCurrent)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Maze))==(?);
  Abstract_List_VisibleVariables(Machine(Maze))==(?);
  External_List_VisibleVariables(Machine(Maze))==(?);
  Expanded_List_VisibleVariables(Machine(Maze))==(?);
  List_VisibleVariables(Machine(Maze))==(?);
  Internal_List_VisibleVariables(Machine(Maze))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Maze))==(btrue);
  Gluing_List_Invariant(Machine(Maze))==(btrue);
  Expanded_List_Invariant(Machine(Maze))==(btrue);
  Abstract_List_Invariant(Machine(Maze))==(btrue);
  Context_List_Invariant(Machine(Maze))==(btrue);
  List_Invariant(Machine(Maze))==(xCurrent: NATURAL1 & xCurrent: xAxis & yCurrent: NATURAL1 & yCurrent: yAxis & visitedRoute: seq(NATURAL1*NATURAL1) & visitedRoute: seq(xAxis*yAxis))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Maze))==(btrue);
  Abstract_List_Assertions(Machine(Maze))==(btrue);
  Context_List_Assertions(Machine(Maze))==(btrue);
  List_Assertions(Machine(Maze))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Maze))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Maze))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Maze))==(xCurrent,yCurrent,visitedRoute:=1,1,<>);
  Context_List_Initialisation(Machine(Maze))==(skip);
  List_Initialisation(Machine(Maze))==(xCurrent:=1 || yCurrent:=1 || visitedRoute:=<>)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Maze))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Maze))==(btrue);
  List_Constraints(Machine(Maze))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Maze))==(updateRoute,getCurrentPosition,checkSquareVisited,getRobotsRoute,checkExitFound);
  List_Operations(Machine(Maze))==(updateRoute,getCurrentPosition,checkSquareVisited,getRobotsRoute,checkExitFound)
END
&
THEORY ListInputX IS
  List_Input(Machine(Maze),updateRoute)==(xValue,yValue,updatedRoute);
  List_Input(Machine(Maze),getCurrentPosition)==(?);
  List_Input(Machine(Maze),checkSquareVisited)==(xValue,yValue);
  List_Input(Machine(Maze),getRobotsRoute)==(?);
  List_Input(Machine(Maze),checkExitFound)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Maze),updateRoute)==(?);
  List_Output(Machine(Maze),getCurrentPosition)==(currentPosition);
  List_Output(Machine(Maze),checkSquareVisited)==(hasVisited);
  List_Output(Machine(Maze),getRobotsRoute)==(route);
  List_Output(Machine(Maze),checkExitFound)==(exitFound)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Maze),updateRoute)==(updateRoute(xValue,yValue,updatedRoute));
  List_Header(Machine(Maze),getCurrentPosition)==(currentPosition <-- getCurrentPosition);
  List_Header(Machine(Maze),checkSquareVisited)==(hasVisited <-- checkSquareVisited(xValue,yValue));
  List_Header(Machine(Maze),getRobotsRoute)==(route <-- getRobotsRoute);
  List_Header(Machine(Maze),checkExitFound)==(exitFound <-- checkExitFound)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Maze),updateRoute)==(xValue: xAxis & yValue: yAxis & updatedRoute: seq(xAxis*yAxis));
  List_Precondition(Machine(Maze),getCurrentPosition)==(btrue);
  List_Precondition(Machine(Maze),checkSquareVisited)==(xValue: xAxis & yValue: yAxis);
  List_Precondition(Machine(Maze),getRobotsRoute)==(btrue);
  List_Precondition(Machine(Maze),checkExitFound)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Maze),checkExitFound)==(btrue | {xCurrent|->yCurrent} = Exit ==> exitFound:=yes [] not({xCurrent|->yCurrent} = Exit) ==> exitFound:=no);
  Expanded_List_Substitution(Machine(Maze),getRobotsRoute)==(btrue | route:=visitedRoute);
  Expanded_List_Substitution(Machine(Maze),checkSquareVisited)==(xValue: xAxis & yValue: yAxis | xValue|->yValue: ran(visitedRoute) ==> hasVisited:=yes [] not(xValue|->yValue: ran(visitedRoute)) ==> hasVisited:=no);
  Expanded_List_Substitution(Machine(Maze),getCurrentPosition)==(btrue | currentPosition:=xCurrent|->yCurrent);
  Expanded_List_Substitution(Machine(Maze),updateRoute)==(xValue: xAxis & yValue: yAxis & updatedRoute: seq(xAxis*yAxis) | visitedRoute,xCurrent,yCurrent:=updatedRoute,xValue,yValue);
  List_Substitution(Machine(Maze),updateRoute)==(visitedRoute:=updatedRoute || xCurrent:=xValue || yCurrent:=yValue);
  List_Substitution(Machine(Maze),getCurrentPosition)==(currentPosition:=xCurrent|->yCurrent);
  List_Substitution(Machine(Maze),checkSquareVisited)==(IF xValue|->yValue: ran(visitedRoute) THEN hasVisited:=yes ELSE hasVisited:=no END);
  List_Substitution(Machine(Maze),getRobotsRoute)==(route:=visitedRoute);
  List_Substitution(Machine(Maze),checkExitFound)==(IF {xCurrent|->yCurrent} = Exit THEN exitFound:=yes ELSE exitFound:=no END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Maze))==(xAxis,yAxis,Entrance,Exit);
  Inherited_List_Constants(Machine(Maze))==(?);
  List_Constants(Machine(Maze))==(xAxis,yAxis,Entrance,Exit)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Maze),ANSWER)==({yes,no});
  Context_List_Enumerated(Machine(Maze))==(?);
  Context_List_Defered(Machine(Maze))==(?);
  Context_List_Sets(Machine(Maze))==(?);
  List_Valuable_Sets(Machine(Maze))==(?);
  Inherited_List_Enumerated(Machine(Maze))==(?);
  Inherited_List_Defered(Machine(Maze))==(?);
  Inherited_List_Sets(Machine(Maze))==(?);
  List_Enumerated(Machine(Maze))==(ANSWER);
  List_Defered(Machine(Maze))==(?);
  List_Sets(Machine(Maze))==(ANSWER)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Maze))==(?);
  Expanded_List_HiddenConstants(Machine(Maze))==(?);
  List_HiddenConstants(Machine(Maze))==(?);
  External_List_HiddenConstants(Machine(Maze))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Maze))==(btrue);
  Context_List_Properties(Machine(Maze))==(btrue);
  Inherited_List_Properties(Machine(Maze))==(btrue);
  List_Properties(Machine(Maze))==(xAxis <: NATURAL1 & xAxis = 1..7 & yAxis <: NATURAL1 & yAxis = 1..5 & Entrance: NATURAL1 <-> NATURAL1 & Entrance = {1|->1} & Exit: NATURAL1 <-> NATURAL1 & Exit = {1|->5} & ANSWER: FIN(INTEGER) & not(ANSWER = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Maze),updateRoute)==(?);
  List_ANY_Var(Machine(Maze),getCurrentPosition)==(?);
  List_ANY_Var(Machine(Maze),checkSquareVisited)==(?);
  List_ANY_Var(Machine(Maze),getRobotsRoute)==(?);
  List_ANY_Var(Machine(Maze),checkExitFound)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Maze)) == (xAxis,yAxis,Entrance,Exit,ANSWER,yes,no | ? | visitedRoute,yCurrent,xCurrent | ? | updateRoute,getCurrentPosition,checkSquareVisited,getRobotsRoute,checkExitFound | ? | ? | ? | Maze);
  List_Of_HiddenCst_Ids(Machine(Maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Maze)) == (xAxis,yAxis,Entrance,Exit);
  List_Of_VisibleVar_Ids(Machine(Maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Maze)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Maze)) == (Type(ANSWER) == Cst(SetOf(etype(ANSWER,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Maze)) == (Type(yes) == Cst(etype(ANSWER,0,1));Type(no) == Cst(etype(ANSWER,0,1));Type(xAxis) == Cst(SetOf(btype(INTEGER,"[xAxis","]xAxis")));Type(yAxis) == Cst(SetOf(btype(INTEGER,"[yAxis","]yAxis")));Type(Entrance) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(Exit) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Maze)) == (Type(visitedRoute) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(yCurrent) == Mvl(btype(INTEGER,?,?));Type(xCurrent) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Maze)) == (Type(checkExitFound) == Cst(etype(ANSWER,?,?),No_type);Type(getRobotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(checkSquareVisited) == Cst(etype(ANSWER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(getCurrentPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(updateRoute) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?)))));
  Observers(Machine(Maze)) == (Type(checkExitFound) == Cst(etype(ANSWER,?,?),No_type);Type(getRobotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(checkSquareVisited) == Cst(etype(ANSWER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(getCurrentPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
