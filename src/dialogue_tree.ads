with Ada.Containers.Vectors, Ada.Strings.Unbounded;
use Ada.Containers, Ada.Strings.Unbounded;

package Dialogue_Tree is

   type Tree_Node;
   type Tree_Access is access Tree_Node;
   
   package Node_Vector is new Vectors
     (Element_Type => Tree_Access,
      Index_Type => Positive);
   
   package Text_Vector is new Vectors
     (Element_Type => Unbounded_String,
      Index_Type => Positive);
   
   type Tree_Node is tagged record
      Text: Unbounded_String;
      Choices: Text_Vector.Vector; 
      Children: Node_Vector.Vector;
   end record;
   
   procedure Add_Node(Self: in out Tree_Node; New_Node: Tree_Access; Dialogue_Option: String);

end Dialogue_Tree;
