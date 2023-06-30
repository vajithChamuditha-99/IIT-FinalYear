/* Maze
 * Author: Hp
 * Creation date: 1/6/2023
 */
MACHINE
    Maze

SETS
    ANSWER = { yes , no }

CONCRETE_CONSTANTS
    xAxis ,
    yAxis ,
    Entrance ,
    Exit

PROPERTIES
    xAxis <: NATURAL1 &
    xAxis = 1 .. 7 &
    yAxis <: NATURAL1 &
    yAxis = 1 .. 5 &
    Entrance : NATURAL1 <-> NATURAL1 &
    Entrance = { ( 1 |-> 1 ) } &
    Exit : NATURAL1 <-> NATURAL1 &
    Exit = { ( 1 |-> 5 ) }

ABSTRACT_VARIABLES
   xCurrent ,
   yCurrent ,
   visitedRoute

INVARIANT
    xCurrent : NATURAL1 &
    xCurrent : xAxis &
    yCurrent : NATURAL1 &
    yCurrent : yAxis &
    visitedRoute : seq ( NATURAL1 * NATURAL1 ) &
    visitedRoute : seq ( xAxis * yAxis )

INITIALISATION
    xCurrent := 1 ||
    yCurrent := 1 ||
    visitedRoute := []

OPERATIONS
    //updates route
    updateRoute ( xValue , yValue , updatedRoute ) =
    PRE
        xValue : xAxis &
        yValue : yAxis &
        updatedRoute : seq ( xAxis * yAxis )
    THEN
       visitedRoute := updatedRoute ||
       xCurrent := xValue ||
       yCurrent := yValue
       END ;


    //get current position of the robot
    currentPosition <-- getCurrentPosition =
    BEGIN
        currentPosition := ( xCurrent |-> yCurrent )
    END ;

    //check if the robot has visited a given square
    hasVisited <-- checkSquareVisited ( xValue , yValue ) =
    PRE
        xValue : xAxis &
        yValue : yAxis
    THEN
        IF
            ( xValue |-> yValue ) : ran ( visitedRoute )
        THEN
            hasVisited := yes
        ELSE
            hasVisited := no
            END
    END ;

    //get robot's route
    route <-- getRobotsRoute =
    BEGIN
        route := visitedRoute
    END ;

    //check if robot has came to the exit
    exitFound <-- checkExitFound =
    IF
        { ( xCurrent |-> yCurrent ) } = Exit
    THEN
        exitFound := yes
    ELSE
        exitFound := no
        END


END
