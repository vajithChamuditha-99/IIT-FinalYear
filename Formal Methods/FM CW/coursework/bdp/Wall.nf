Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Wall))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Wall))==(Machine(Wall));
  Level(Machine(Wall))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Wall)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Wall))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Wall))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Wall))==(?);
  List_Includes(Machine(Wall))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Wall))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Wall))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Wall))==(?);
  Context_List_Variables(Machine(Wall))==(?);
  Abstract_List_Variables(Machine(Wall))==(?);
  Local_List_Variables(Machine(Wall))==(?);
  List_Variables(Machine(Wall))==(?);
  External_List_Variables(Machine(Wall))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Wall))==(?);
  Abstract_List_VisibleVariables(Machine(Wall))==(?);
  External_List_VisibleVariables(Machine(Wall))==(?);
  Expanded_List_VisibleVariables(Machine(Wall))==(?);
  List_VisibleVariables(Machine(Wall))==(?);
  Internal_List_VisibleVariables(Machine(Wall))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Wall))==(btrue);
  Gluing_List_Invariant(Machine(Wall))==(btrue);
  Expanded_List_Invariant(Machine(Wall))==(btrue);
  Abstract_List_Invariant(Machine(Wall))==(btrue);
  Context_List_Invariant(Machine(Wall))==(btrue);
  List_Invariant(Machine(Wall))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Wall))==(btrue);
  Abstract_List_Assertions(Machine(Wall))==(btrue);
  Context_List_Assertions(Machine(Wall))==(btrue);
  List_Assertions(Machine(Wall))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Wall))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Wall))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Wall))==(skip);
  Context_List_Initialisation(Machine(Wall))==(skip);
  List_Initialisation(Machine(Wall))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Wall))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Wall))==(btrue);
  List_Constraints(Machine(Wall))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Wall))==(?);
  List_Operations(Machine(Wall))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Wall))==(Walls);
  Inherited_List_Constants(Machine(Wall))==(?);
  List_Constants(Machine(Wall))==(Walls)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Wall))==(?);
  Context_List_Defered(Machine(Wall))==(?);
  Context_List_Sets(Machine(Wall))==(?);
  List_Valuable_Sets(Machine(Wall))==(?);
  Inherited_List_Enumerated(Machine(Wall))==(?);
  Inherited_List_Defered(Machine(Wall))==(?);
  Inherited_List_Sets(Machine(Wall))==(?);
  List_Enumerated(Machine(Wall))==(?);
  List_Defered(Machine(Wall))==(?);
  List_Sets(Machine(Wall))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Wall))==(?);
  Expanded_List_HiddenConstants(Machine(Wall))==(?);
  List_HiddenConstants(Machine(Wall))==(?);
  External_List_HiddenConstants(Machine(Wall))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Wall))==(btrue);
  Context_List_Properties(Machine(Wall))==(btrue);
  Inherited_List_Properties(Machine(Wall))==(btrue);
  List_Properties(Machine(Wall))==(Walls: NATURAL1 <-> NATURAL1 & Walls = {1|->3,2|->1,2|->3,2|->5,3|->3,4|->2,4|->3,4|->4,6|->1,6|->2,6|->4,7|->4})
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Wall)) == (Walls | ? | ? | ? | ? | ? | ? | ? | Wall);
  List_Of_HiddenCst_Ids(Machine(Wall)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Wall)) == (Walls);
  List_Of_VisibleVar_Ids(Machine(Wall)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Wall)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Wall)) == (Type(Walls) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))))
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
