/* Robot
 * Author: Hp
 * Creation date: 1/6/2023
 */
MACHINE
    Robot

INCLUDES
    Maze

SEES
    Wall

PROMOTES
    checkExitFound ,
    getRobotsRoute ,
    getCurrentPosition ,
    checkSquareVisited

SETS
    DIRECTIONS = { North ,
                South ,
                East ,
                West ,
            Teleport } ;

    OUTPUT_MESSAGES = { MoveFailedDueToInternalWall ,
                     TeleportFailedDueToInternalWall ,
                     MoveFailedDueToMazeBoundary ,
                     TeleoprtFailedDueToMazeBoundary ,
                     CannotTeleportToCurrentSquare ,
                     MovedSuccessfully ,
                     TeleportedSuccessfully ,
                     RobotResetedSuccessfully }

ABSTRACT_VARIABLES
    xCoordinate ,
    yCoordinate ,
    visited_derection

INVARIANT
    xCoordinate : NATURAL1 &
    yCoordinate : NATURAL1 &
    xCoordinate : xAxis &
    yCoordinate : yAxis &
    visited_derection : seq ( DIRECTIONS )

INITIALISATION
    xCoordinate := 1 ||
    yCoordinate := 1 ||
    visited_derection := <>














OPERATIONS
    //Robots north movement
    message <-- moveNorth =
    PRE
        not ( ( xCoordinate |-> yCoordinate = ( 1 |-> 5 ) ) )
    THEN
        IF ( yCoordinate + 1 : yAxis & ( xCoordinate |-> yCoordinate + 1 /: Walls ) )
        THEN
            yCoordinate := yCoordinate + 1 ||
            updateRoute ( xCoordinate , yCoordinate + 1 , visitedRoute <- ( xCoordinate |-> yCoordinate ) ) ||
            visited_derection := visited_derection <- North ||
            message := MovedSuccessfully
        ELSIF ( yCoordinate + 1 /: yAxis )
        THEN
            message := MoveFailedDueToMazeBoundary
        ELSE
            message := MoveFailedDueToInternalWall
        END
    END ;

    //Robots south movement
    message <-- moveSouth =
    PRE
        not ( ( xCoordinate |-> yCoordinate = ( 1 |-> 5 ) ) )
    THEN
        IF ( yCoordinate - 1 : yAxis & ( xCoordinate |-> yCoordinate - 1 /: Walls ) & not ( ( xCoordinate |-> yCoordinate = ( 1 |-> 5 ) ) ) )
        THEN
            yCoordinate := yCoordinate - 1 ||
            updateRoute ( xCoordinate , yCoordinate - 1 , visitedRoute <- ( xCoordinate |-> yCoordinate ) ) ||
            visited_derection := visited_derection <- South ||
            message := MovedSuccessfully
        ELSIF ( yCoordinate - 1 /: yAxis )
        THEN
            message := MoveFailedDueToMazeBoundary
        ELSE
            message := MoveFailedDueToInternalWall
            END
    END ;

    //Robots east movement
    message <-- moveEast =
    PRE
        not ( ( xCoordinate |-> yCoordinate = ( 1 |-> 5 ) ) )
    THEN
        IF ( xCoordinate + 1 : xAxis & ( xCoordinate + 1 |-> yCoordinate /: Walls ) )
        THEN
            xCoordinate := xCoordinate + 1 ||
            updateRoute ( xCoordinate + 1 , yCoordinate , visitedRoute <- ( xCoordinate |-> yCoordinate ) ) ||
            visited_derection := visited_derection <- East ||
            message := MovedSuccessfully
        ELSIF ( xCoordinate + 1 /: xAxis )
        THEN
            message := MoveFailedDueToMazeBoundary
        ELSE
            message := MoveFailedDueToInternalWall
            END
    END ;

    //Robots west movement
    message <-- moveWest =
    PRE
        not ( ( xCoordinate |-> yCoordinate = ( 1 |-> 5 ) ) )
    THEN
        IF ( xCoordinate - 1 : xAxis & ( xCoordinate - 1 |-> yCoordinate /: Walls ) )
        THEN
            xCoordinate := xCoordinate - 1 ||
            updateRoute ( xCoordinate - 1 , yCoordinate , visitedRoute <- ( xCoordinate |-> yCoordinate ) ) ||
            visited_derection := visited_derection <- West ||
            message := MovedSuccessfully
        ELSIF ( xCoordinate - 1 /: xAxis )
        THEN
            message := MoveFailedDueToMazeBoundary
        ELSE
            message := MoveFailedDueToInternalWall
            END
    END ;

   //Teleportation of robot to any position
   teleportMessage  <-- teleport ( xTeleportPoint , yTeleportPoint ) =
   PRE
       xTeleportPoint : xAxis &
       yTeleportPoint : yAxis &
       not ( ( xCoordinate |-> yCoordinate = ( 1 |-> 5 ) ) )
   THEN
       IF
           ( ( xTeleportPoint |-> yTeleportPoint ) /: Walls &
            ( xTeleportPoint |-> yTeleportPoint ) /: { ( xCoordinate |-> yCoordinate ) } )
       THEN
           xCoordinate := xTeleportPoint ||
           yCoordinate := yTeleportPoint ||
           teleportMessage := TeleportedSuccessfully ||
                     updateRoute ( xTeleportPoint , yTeleportPoint , visitedRoute <- ( xCoordinate |-> yCoordinate ) ) ||
                     visited_derection := visited_derection <- ( Teleport )
       ELSE IF
               ( ( xTeleportPoint |-> yTeleportPoint ) : Walls )
           THEN
               teleportMessage := TeleportFailedDueToInternalWall
       ELSE
            teleportMessage := CannotTeleportToCurrentSquare

           END
       END
   END ;

   //Reset robots position
   report <-- reset =
    PRE report : OUTPUT_MESSAGES
    THEN
        xCoordinate := 1 ||
        yCoordinate := 1 ||
        visited_derection := <> ||
        report := RobotResetedSuccessfully
    END

END
