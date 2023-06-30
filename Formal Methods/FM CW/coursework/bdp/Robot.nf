Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Robot))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Robot))==(Machine(Robot));
  Level(Machine(Robot))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Robot)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Robot))==(Wall)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Robot))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Robot))==(Maze);
  List_Includes(Machine(Robot))==(Maze)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Robot))==(checkExitFound,getRobotsRoute,getCurrentPosition,checkSquareVisited)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Robot))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Robot))==(?);
  Context_List_Variables(Machine(Robot))==(?);
  Abstract_List_Variables(Machine(Robot))==(?);
  Local_List_Variables(Machine(Robot))==(visited_derection,yCoordinate,xCoordinate);
  List_Variables(Machine(Robot))==(visited_derection,yCoordinate,xCoordinate,visitedRoute,yCurrent,xCurrent);
  External_List_Variables(Machine(Robot))==(visited_derection,yCoordinate,xCoordinate,visitedRoute,yCurrent,xCurrent)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Robot))==(?);
  Abstract_List_VisibleVariables(Machine(Robot))==(?);
  External_List_VisibleVariables(Machine(Robot))==(?);
  Expanded_List_VisibleVariables(Machine(Robot))==(?);
  List_VisibleVariables(Machine(Robot))==(?);
  Internal_List_VisibleVariables(Machine(Robot))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Robot))==(btrue);
  Gluing_List_Invariant(Machine(Robot))==(btrue);
  Abstract_List_Invariant(Machine(Robot))==(btrue);
  Expanded_List_Invariant(Machine(Robot))==(xCurrent: NATURAL1 & xCurrent: xAxis & yCurrent: NATURAL1 & yCurrent: yAxis & visitedRoute: seq(NATURAL1*NATURAL1) & visitedRoute: seq(xAxis*yAxis));
  Context_List_Invariant(Machine(Robot))==(btrue);
  List_Invariant(Machine(Robot))==(xCoordinate: NATURAL1 & yCoordinate: NATURAL1 & xCoordinate: xAxis & yCoordinate: yAxis & visited_derection: seq(DIRECTIONS))
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Robot))==(btrue);
  Expanded_List_Assertions(Machine(Robot))==(btrue);
  Context_List_Assertions(Machine(Robot))==(btrue);
  List_Assertions(Machine(Robot))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Robot))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Robot))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Robot))==(xCurrent,yCurrent,visitedRoute:=1,1,<>;xCoordinate,yCoordinate,visited_derection:=1,1,<>);
  Context_List_Initialisation(Machine(Robot))==(skip);
  List_Initialisation(Machine(Robot))==(xCoordinate:=1 || yCoordinate:=1 || visited_derection:=<>)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Robot))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Robot),Machine(Maze))==(?);
  List_Instanciated_Parameters(Machine(Robot),Machine(Wall))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Robot),Machine(Maze))==(btrue);
  List_Context_Constraints(Machine(Robot))==(btrue);
  List_Constraints(Machine(Robot))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Robot))==(moveNorth,moveSouth,moveEast,moveWest,teleport,reset,getCurrentPosition,checkSquareVisited,getRobotsRoute,checkExitFound);
  List_Operations(Machine(Robot))==(moveNorth,moveSouth,moveEast,moveWest,teleport,reset,getCurrentPosition,checkSquareVisited,getRobotsRoute,checkExitFound)
END
&
THEORY ListInputX IS
  List_Input(Machine(Robot),checkExitFound)==(?);
  List_Input(Machine(Robot),getRobotsRoute)==(?);
  List_Input(Machine(Robot),checkSquareVisited)==(xValue,yValue);
  List_Input(Machine(Robot),getCurrentPosition)==(?);
  List_Input(Machine(Robot),moveNorth)==(?);
  List_Input(Machine(Robot),moveSouth)==(?);
  List_Input(Machine(Robot),moveEast)==(?);
  List_Input(Machine(Robot),moveWest)==(?);
  List_Input(Machine(Robot),teleport)==(xTeleportPoint,yTeleportPoint);
  List_Input(Machine(Robot),reset)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Robot),checkExitFound)==(exitFound);
  List_Output(Machine(Robot),getRobotsRoute)==(route);
  List_Output(Machine(Robot),checkSquareVisited)==(hasVisited);
  List_Output(Machine(Robot),getCurrentPosition)==(currentPosition);
  List_Output(Machine(Robot),moveNorth)==(message);
  List_Output(Machine(Robot),moveSouth)==(message);
  List_Output(Machine(Robot),moveEast)==(message);
  List_Output(Machine(Robot),moveWest)==(message);
  List_Output(Machine(Robot),teleport)==(teleportMessage);
  List_Output(Machine(Robot),reset)==(report)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Robot),checkExitFound)==(exitFound <-- checkExitFound);
  List_Header(Machine(Robot),getRobotsRoute)==(route <-- getRobotsRoute);
  List_Header(Machine(Robot),checkSquareVisited)==(hasVisited <-- checkSquareVisited(xValue,yValue));
  List_Header(Machine(Robot),getCurrentPosition)==(currentPosition <-- getCurrentPosition);
  List_Header(Machine(Robot),moveNorth)==(message <-- moveNorth);
  List_Header(Machine(Robot),moveSouth)==(message <-- moveSouth);
  List_Header(Machine(Robot),moveEast)==(message <-- moveEast);
  List_Header(Machine(Robot),moveWest)==(message <-- moveWest);
  List_Header(Machine(Robot),teleport)==(teleportMessage <-- teleport(xTeleportPoint,yTeleportPoint));
  List_Header(Machine(Robot),reset)==(report <-- reset)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(Robot),checkExitFound)==(btrue);
  List_Precondition(Machine(Robot),checkExitFound)==(btrue);
  Own_Precondition(Machine(Robot),getRobotsRoute)==(btrue);
  List_Precondition(Machine(Robot),getRobotsRoute)==(btrue);
  Own_Precondition(Machine(Robot),checkSquareVisited)==(xValue: xAxis & yValue: yAxis);
  List_Precondition(Machine(Robot),checkSquareVisited)==(xValue: xAxis & yValue: yAxis);
  Own_Precondition(Machine(Robot),getCurrentPosition)==(btrue);
  List_Precondition(Machine(Robot),getCurrentPosition)==(btrue);
  List_Precondition(Machine(Robot),moveNorth)==(not(xCoordinate|->yCoordinate = 1|->5));
  List_Precondition(Machine(Robot),moveSouth)==(not(xCoordinate|->yCoordinate = 1|->5));
  List_Precondition(Machine(Robot),moveEast)==(not(xCoordinate|->yCoordinate = 1|->5));
  List_Precondition(Machine(Robot),moveWest)==(not(xCoordinate|->yCoordinate = 1|->5));
  List_Precondition(Machine(Robot),teleport)==(xTeleportPoint: xAxis & yTeleportPoint: yAxis & not(xCoordinate|->yCoordinate = 1|->5));
  List_Precondition(Machine(Robot),reset)==(report: OUTPUT_MESSAGES)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Robot),reset)==(report: OUTPUT_MESSAGES | xCoordinate,yCoordinate,visited_derection,report:=1,1,<>,RobotResetedSuccessfully);
  Expanded_List_Substitution(Machine(Robot),teleport)==(xTeleportPoint: xAxis & yTeleportPoint: yAxis & not(xCoordinate|->yCoordinate = 1|->5) | xTeleportPoint|->yTeleportPoint/:Walls & xTeleportPoint|->yTeleportPoint/:{xCoordinate|->yCoordinate} ==> (xTeleportPoint: xAxis & yTeleportPoint: yAxis & visitedRoute<-(xCoordinate|->yCoordinate): seq(xAxis*yAxis) | xCoordinate,yCoordinate,teleportMessage:=xTeleportPoint,yTeleportPoint,TeleportedSuccessfully || visitedRoute,xCurrent,yCurrent:=visitedRoute<-(xCoordinate|->yCoordinate),xTeleportPoint,yTeleportPoint || visited_derection:=visited_derection<-Teleport) [] not(xTeleportPoint|->yTeleportPoint/:Walls & xTeleportPoint|->yTeleportPoint/:{xCoordinate|->yCoordinate}) ==> (xTeleportPoint|->yTeleportPoint: Walls ==> teleportMessage:=TeleportFailedDueToInternalWall [] not(xTeleportPoint|->yTeleportPoint: Walls) ==> teleportMessage:=CannotTeleportToCurrentSquare));
  Expanded_List_Substitution(Machine(Robot),moveWest)==(not(xCoordinate|->yCoordinate = 1|->5) | xCoordinate-1: xAxis & xCoordinate-1|->yCoordinate/:Walls ==> (xCoordinate-1: xAxis & yCoordinate: yAxis & visitedRoute<-(xCoordinate|->yCoordinate): seq(xAxis*yAxis) | xCoordinate:=xCoordinate-1 || visitedRoute,xCurrent,yCurrent:=visitedRoute<-(xCoordinate|->yCoordinate),xCoordinate-1,yCoordinate || visited_derection:=visited_derection<-West || message:=MovedSuccessfully) [] not(xCoordinate-1: xAxis & xCoordinate-1|->yCoordinate/:Walls) ==> (xCoordinate-1/:xAxis ==> message:=MoveFailedDueToMazeBoundary [] not(xCoordinate-1/:xAxis) ==> message:=MoveFailedDueToInternalWall));
  Expanded_List_Substitution(Machine(Robot),moveEast)==(not(xCoordinate|->yCoordinate = 1|->5) | xCoordinate+1: xAxis & xCoordinate+1|->yCoordinate/:Walls ==> (xCoordinate+1: xAxis & yCoordinate: yAxis & visitedRoute<-(xCoordinate|->yCoordinate): seq(xAxis*yAxis) | xCoordinate:=xCoordinate+1 || visitedRoute,xCurrent,yCurrent:=visitedRoute<-(xCoordinate|->yCoordinate),xCoordinate+1,yCoordinate || visited_derection:=visited_derection<-East || message:=MovedSuccessfully) [] not(xCoordinate+1: xAxis & xCoordinate+1|->yCoordinate/:Walls) ==> (xCoordinate+1/:xAxis ==> message:=MoveFailedDueToMazeBoundary [] not(xCoordinate+1/:xAxis) ==> message:=MoveFailedDueToInternalWall));
  Expanded_List_Substitution(Machine(Robot),moveSouth)==(not(xCoordinate|->yCoordinate = 1|->5) | yCoordinate-1: yAxis & xCoordinate|->yCoordinate-1/:Walls & not(xCoordinate|->yCoordinate = 1|->5) ==> (xCoordinate: xAxis & yCoordinate-1: yAxis & visitedRoute<-(xCoordinate|->yCoordinate): seq(xAxis*yAxis) | yCoordinate:=yCoordinate-1 || visitedRoute,xCurrent,yCurrent:=visitedRoute<-(xCoordinate|->yCoordinate),xCoordinate,yCoordinate-1 || visited_derection:=visited_derection<-South || message:=MovedSuccessfully) [] not(yCoordinate-1: yAxis & xCoordinate|->yCoordinate-1/:Walls & not(xCoordinate|->yCoordinate = 1|->5)) ==> (yCoordinate-1/:yAxis ==> message:=MoveFailedDueToMazeBoundary [] not(yCoordinate-1/:yAxis) ==> message:=MoveFailedDueToInternalWall));
  Expanded_List_Substitution(Machine(Robot),moveNorth)==(not(xCoordinate|->yCoordinate = 1|->5) | yCoordinate+1: yAxis & xCoordinate|->yCoordinate+1/:Walls ==> (xCoordinate: xAxis & yCoordinate+1: yAxis & visitedRoute<-(xCoordinate|->yCoordinate): seq(xAxis*yAxis) | yCoordinate:=yCoordinate+1 || visitedRoute,xCurrent,yCurrent:=visitedRoute<-(xCoordinate|->yCoordinate),xCoordinate,yCoordinate+1 || visited_derection:=visited_derection<-North || message:=MovedSuccessfully) [] not(yCoordinate+1: yAxis & xCoordinate|->yCoordinate+1/:Walls) ==> (yCoordinate+1/:yAxis ==> message:=MoveFailedDueToMazeBoundary [] not(yCoordinate+1/:yAxis) ==> message:=MoveFailedDueToInternalWall));
  List_Substitution(Machine(Robot),checkExitFound)==(IF {xCurrent|->yCurrent} = Exit THEN exitFound:=yes ELSE exitFound:=no END);
  Expanded_List_Substitution(Machine(Robot),checkExitFound)==(btrue | {xCurrent|->yCurrent} = Exit ==> exitFound:=yes [] not({xCurrent|->yCurrent} = Exit) ==> exitFound:=no);
  List_Substitution(Machine(Robot),getRobotsRoute)==(route:=visitedRoute);
  Expanded_List_Substitution(Machine(Robot),getRobotsRoute)==(btrue | route:=visitedRoute);
  List_Substitution(Machine(Robot),checkSquareVisited)==(IF xValue|->yValue: ran(visitedRoute) THEN hasVisited:=yes ELSE hasVisited:=no END);
  Expanded_List_Substitution(Machine(Robot),checkSquareVisited)==(xValue: xAxis & yValue: yAxis | xValue|->yValue: ran(visitedRoute) ==> hasVisited:=yes [] not(xValue|->yValue: ran(visitedRoute)) ==> hasVisited:=no);
  List_Substitution(Machine(Robot),getCurrentPosition)==(currentPosition:=xCurrent|->yCurrent);
  Expanded_List_Substitution(Machine(Robot),getCurrentPosition)==(btrue | currentPosition:=xCurrent|->yCurrent);
  List_Substitution(Machine(Robot),moveNorth)==(IF yCoordinate+1: yAxis & xCoordinate|->yCoordinate+1/:Walls THEN yCoordinate:=yCoordinate+1 || updateRoute(xCoordinate,yCoordinate+1,visitedRoute<-(xCoordinate|->yCoordinate)) || visited_derection:=visited_derection<-North || message:=MovedSuccessfully ELSIF yCoordinate+1/:yAxis THEN message:=MoveFailedDueToMazeBoundary ELSE message:=MoveFailedDueToInternalWall END);
  List_Substitution(Machine(Robot),moveSouth)==(IF yCoordinate-1: yAxis & xCoordinate|->yCoordinate-1/:Walls & not(xCoordinate|->yCoordinate = 1|->5) THEN yCoordinate:=yCoordinate-1 || updateRoute(xCoordinate,yCoordinate-1,visitedRoute<-(xCoordinate|->yCoordinate)) || visited_derection:=visited_derection<-South || message:=MovedSuccessfully ELSIF yCoordinate-1/:yAxis THEN message:=MoveFailedDueToMazeBoundary ELSE message:=MoveFailedDueToInternalWall END);
  List_Substitution(Machine(Robot),moveEast)==(IF xCoordinate+1: xAxis & xCoordinate+1|->yCoordinate/:Walls THEN xCoordinate:=xCoordinate+1 || updateRoute(xCoordinate+1,yCoordinate,visitedRoute<-(xCoordinate|->yCoordinate)) || visited_derection:=visited_derection<-East || message:=MovedSuccessfully ELSIF xCoordinate+1/:xAxis THEN message:=MoveFailedDueToMazeBoundary ELSE message:=MoveFailedDueToInternalWall END);
  List_Substitution(Machine(Robot),moveWest)==(IF xCoordinate-1: xAxis & xCoordinate-1|->yCoordinate/:Walls THEN xCoordinate:=xCoordinate-1 || updateRoute(xCoordinate-1,yCoordinate,visitedRoute<-(xCoordinate|->yCoordinate)) || visited_derection:=visited_derection<-West || message:=MovedSuccessfully ELSIF xCoordinate-1/:xAxis THEN message:=MoveFailedDueToMazeBoundary ELSE message:=MoveFailedDueToInternalWall END);
  List_Substitution(Machine(Robot),teleport)==(IF xTeleportPoint|->yTeleportPoint/:Walls & xTeleportPoint|->yTeleportPoint/:{xCoordinate|->yCoordinate} THEN xCoordinate:=xTeleportPoint || yCoordinate:=yTeleportPoint || teleportMessage:=TeleportedSuccessfully || updateRoute(xTeleportPoint,yTeleportPoint,visitedRoute<-(xCoordinate|->yCoordinate)) || visited_derection:=visited_derection<-Teleport ELSE IF xTeleportPoint|->yTeleportPoint: Walls THEN teleportMessage:=TeleportFailedDueToInternalWall ELSE teleportMessage:=CannotTeleportToCurrentSquare END END);
  List_Substitution(Machine(Robot),reset)==(xCoordinate:=1 || yCoordinate:=1 || visited_derection:=<> || report:=RobotResetedSuccessfully)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Robot))==(xAxis,yAxis,Entrance,Exit);
  Inherited_List_Constants(Machine(Robot))==(xAxis,yAxis,Entrance,Exit);
  List_Constants(Machine(Robot))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Robot),ANSWER)==({yes,no});
  Context_List_Enumerated(Machine(Robot))==(?);
  Context_List_Defered(Machine(Robot))==(?);
  Context_List_Sets(Machine(Robot))==(?);
  List_Valuable_Sets(Machine(Robot))==(?);
  Inherited_List_Enumerated(Machine(Robot))==(ANSWER);
  Inherited_List_Defered(Machine(Robot))==(?);
  Inherited_List_Sets(Machine(Robot))==(ANSWER);
  List_Enumerated(Machine(Robot))==(DIRECTIONS,OUTPUT_MESSAGES);
  List_Defered(Machine(Robot))==(?);
  List_Sets(Machine(Robot))==(DIRECTIONS,OUTPUT_MESSAGES);
  Set_Definition(Machine(Robot),DIRECTIONS)==({North,South,East,West,Teleport});
  Set_Definition(Machine(Robot),OUTPUT_MESSAGES)==({MoveFailedDueToInternalWall,TeleportFailedDueToInternalWall,MoveFailedDueToMazeBoundary,TeleoprtFailedDueToMazeBoundary,CannotTeleportToCurrentSquare,MovedSuccessfully,TeleportedSuccessfully,RobotResetedSuccessfully})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Robot))==(?);
  Expanded_List_HiddenConstants(Machine(Robot))==(?);
  List_HiddenConstants(Machine(Robot))==(?);
  External_List_HiddenConstants(Machine(Robot))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Robot))==(btrue);
  Context_List_Properties(Machine(Robot))==(Walls: NATURAL1 <-> NATURAL1 & Walls = {1|->3,2|->1,2|->3,2|->5,3|->3,4|->2,4|->3,4|->4,6|->1,6|->2,6|->4,7|->4});
  Inherited_List_Properties(Machine(Robot))==(xAxis <: NATURAL1 & xAxis = 1..7 & yAxis <: NATURAL1 & yAxis = 1..5 & Entrance: NATURAL1 <-> NATURAL1 & Entrance = {1|->1} & Exit: NATURAL1 <-> NATURAL1 & Exit = {1|->5} & ANSWER: FIN(INTEGER) & not(ANSWER = {}));
  List_Properties(Machine(Robot))==(DIRECTIONS: FIN(INTEGER) & not(DIRECTIONS = {}) & OUTPUT_MESSAGES: FIN(INTEGER) & not(OUTPUT_MESSAGES = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Robot),Machine(Wall))==(?);
  Seen_Context_List_Enumerated(Machine(Robot))==(?);
  Seen_Context_List_Invariant(Machine(Robot))==(btrue);
  Seen_Context_List_Assertions(Machine(Robot))==(btrue);
  Seen_Context_List_Properties(Machine(Robot))==(btrue);
  Seen_List_Constraints(Machine(Robot))==(btrue);
  Seen_List_Operations(Machine(Robot),Machine(Wall))==(?);
  Seen_Expanded_List_Invariant(Machine(Robot),Machine(Wall))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Robot),checkExitFound)==(?);
  List_ANY_Var(Machine(Robot),getRobotsRoute)==(?);
  List_ANY_Var(Machine(Robot),checkSquareVisited)==(?);
  List_ANY_Var(Machine(Robot),getCurrentPosition)==(?);
  List_ANY_Var(Machine(Robot),moveNorth)==(?);
  List_ANY_Var(Machine(Robot),moveSouth)==(?);
  List_ANY_Var(Machine(Robot),moveEast)==(?);
  List_ANY_Var(Machine(Robot),moveWest)==(?);
  List_ANY_Var(Machine(Robot),teleport)==(?);
  List_ANY_Var(Machine(Robot),reset)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Robot)) == (DIRECTIONS,OUTPUT_MESSAGES,North,South,East,West,Teleport,MoveFailedDueToInternalWall,TeleportFailedDueToInternalWall,MoveFailedDueToMazeBoundary,TeleoprtFailedDueToMazeBoundary,CannotTeleportToCurrentSquare,MovedSuccessfully,TeleportedSuccessfully,RobotResetedSuccessfully | xAxis,yAxis,Entrance,Exit,ANSWER,yes,no | visited_derection,yCoordinate,xCoordinate | V,visitedRoute,yCurrent,xCurrent | moveNorth,moveSouth,moveEast,moveWest,teleport,reset | checkExitFound,getRobotsRoute,getCurrentPosition,checkSquareVisited | seen(Machine(Wall)),included(Machine(Maze)) | ? | Robot);
  List_Of_HiddenCst_Ids(Machine(Robot)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Robot)) == (xAxis,yAxis,Entrance,Exit);
  List_Of_VisibleVar_Ids(Machine(Robot)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Robot)) == (?: ?);
  List_Of_Ids(Machine(Maze)) == (xAxis,yAxis,Entrance,Exit,ANSWER,yes,no | ? | visitedRoute,yCurrent,xCurrent | ? | updateRoute,getCurrentPosition,checkSquareVisited,getRobotsRoute,checkExitFound | ? | ? | ? | Maze);
  List_Of_HiddenCst_Ids(Machine(Maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Maze)) == (xAxis,yAxis,Entrance,Exit);
  List_Of_VisibleVar_Ids(Machine(Maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Maze)) == (?: ?);
  List_Of_Ids(Machine(Wall)) == (Walls | ? | ? | ? | ? | ? | ? | ? | Wall);
  List_Of_HiddenCst_Ids(Machine(Wall)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Wall)) == (Walls);
  List_Of_VisibleVar_Ids(Machine(Wall)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Wall)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Robot)) == (Type(ANSWER) == Cst(SetOf(etype(ANSWER,0,1)));Type(DIRECTIONS) == Cst(SetOf(etype(DIRECTIONS,0,4)));Type(OUTPUT_MESSAGES) == Cst(SetOf(etype(OUTPUT_MESSAGES,0,7))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Robot)) == (Type(Exit) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(Entrance) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(yAxis) == Cst(SetOf(btype(INTEGER,"[yAxis","]yAxis")));Type(xAxis) == Cst(SetOf(btype(INTEGER,"[xAxis","]xAxis")));Type(no) == Cst(etype(ANSWER,0,1));Type(yes) == Cst(etype(ANSWER,0,1));Type(North) == Cst(etype(DIRECTIONS,0,4));Type(South) == Cst(etype(DIRECTIONS,0,4));Type(East) == Cst(etype(DIRECTIONS,0,4));Type(West) == Cst(etype(DIRECTIONS,0,4));Type(Teleport) == Cst(etype(DIRECTIONS,0,4));Type(MoveFailedDueToInternalWall) == Cst(etype(OUTPUT_MESSAGES,0,7));Type(TeleportFailedDueToInternalWall) == Cst(etype(OUTPUT_MESSAGES,0,7));Type(MoveFailedDueToMazeBoundary) == Cst(etype(OUTPUT_MESSAGES,0,7));Type(TeleoprtFailedDueToMazeBoundary) == Cst(etype(OUTPUT_MESSAGES,0,7));Type(CannotTeleportToCurrentSquare) == Cst(etype(OUTPUT_MESSAGES,0,7));Type(MovedSuccessfully) == Cst(etype(OUTPUT_MESSAGES,0,7));Type(TeleportedSuccessfully) == Cst(etype(OUTPUT_MESSAGES,0,7));Type(RobotResetedSuccessfully) == Cst(etype(OUTPUT_MESSAGES,0,7)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Robot)) == (Type(xCurrent) == Mvl(btype(INTEGER,?,?));Type(yCurrent) == Mvl(btype(INTEGER,?,?));Type(visitedRoute) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(visited_derection) == Mvl(SetOf(btype(INTEGER,?,?)*etype(DIRECTIONS,?,?)));Type(yCoordinate) == Mvl(btype(INTEGER,?,?));Type(xCoordinate) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Robot)) == (Type(checkExitFound) == Cst(etype(ANSWER,?,?),No_type);Type(getRobotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(getCurrentPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(checkSquareVisited) == Cst(etype(ANSWER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(reset) == Cst(etype(OUTPUT_MESSAGES,?,?),No_type);Type(teleport) == Cst(etype(OUTPUT_MESSAGES,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(moveWest) == Cst(etype(OUTPUT_MESSAGES,?,?),No_type);Type(moveEast) == Cst(etype(OUTPUT_MESSAGES,?,?),No_type);Type(moveSouth) == Cst(etype(OUTPUT_MESSAGES,?,?),No_type);Type(moveNorth) == Cst(etype(OUTPUT_MESSAGES,?,?),No_type));
  Observers(Machine(Robot)) == (Type(checkExitFound) == Cst(etype(ANSWER,?,?),No_type);Type(getRobotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(getCurrentPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(checkSquareVisited) == Cst(etype(ANSWER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
