with Ada.Strings.Unbounded, Ada.Containers;
use Ada.Strings.Unbounded, Ada.Containers;

package body Dialogue_Tree is
   
   procedure Add_Node(Self: in out Tree_Node; New_Node: Tree_Access; Dialogue_Option: String) is
   begin
      Self.Choices.Append(To_Unbounded_String(Dialogue_Option));
      Self.Children.Append(New_Node);
   end Add_Node;
   
end Dialogue_Tree;
