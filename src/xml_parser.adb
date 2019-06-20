with Input_Sources.File; use Input_Sources.File; 
with DOM.Core.Nodes;     use DOM.Core.Nodes;
with DOM.Core.Elements;  use DOM.Core.Nodes; 
with DOM.Readers;        use DOM.Readers; 
with DOM.Core.Documents; use DOM.Core.Documents;
with Ada.Directories;    use Ada.Directories; 
with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Strings.Fixed;  use Ada.Strings.Fixed;

package body XML_Parser is
   
   function Create_Dialogue_Tree_From_XML_File(Filename: String) return Tree_Access is
      Input: File_Input;
      Reader: Tree_Reader;
      Doc: Document;
      Dialogue: Tree_Access;
      List: Node_List;
   begin
      Flatten_File(Filename);
      Open(Add_To_Filename(Filename, "_flat."), Input);
      Parse(Reader, Input);
      Close(Input);
      
      Doc := Get_Tree(Reader);
      List := Get_Elements_By_Tag_Name(Doc, "dialogue");
      Dialogue := Create_Dialogue(Item(List, 0));
      
      Free(Reader);
      return Dialogue;
   end Create_Dialogue_Tree_From_XML_File;
   
   procedure Flatten_File(Filename: String) is
      Input, Output: File_Type;
   begin
      Open (Input, In_File, Filename);
      Create (Output, Out_File, Add_To_Filename(Filename, "_flat."));
      loop
         declare
            Line: String := Get_Line(Input);
            Trimmed_Line: String := Trim(Line, Ada.Strings.Both);
         begin
            Put(Output, Trimmed_Line);
         end;
      end loop;
      Close(Input);
      Close(Output);
   exception
      when End_Error =>
         if Is_Open(Input) then 
            Close(Input);
         end if;
         if Is_Open(Output) then 
            Close(Output);
         end if;
   end Flatten_File;
   
   function Add_To_Filename(Filename: String; Addition: String) return String is
   begin
      return Base_Name(Filename) & Addition & Extension(Filename);
   end Add_To_Filename;
   
   function Create_Dialogue(Root_Element: Node) return Tree_Access is
      Dialogue: Tree_Access := new Tree_Node;
      New_Child_Dialogue: Tree_Access;
      Children: Node_List := Child_Nodes(Root_Element);
      Text_Element: Node := Item(Children, 0);
      Choice_Elements: Node_List := Child_Nodes(Item(Children, 1));
      Num_Choices: Integer := Length(Choice_Elements);
      Text_Choice: Unbounded_String;
      Branch_Elements: Node_List := Child_Nodes(Item(Children, 2));
   begin
      Dialogue.Text := Get_String_Content(Text_Element);
      for I in 0 .. Num_Choices-1 loop
         Text_Choice := Get_String_Content(Item(Choice_Elements, I));
         Dialogue.Choices.Append(Text_Choice);
         New_Child_Dialogue := Create_Dialogue(Item(Branch_Elements, I));
         Dialogue.Children.Append(New_Child_Dialogue);
      end loop;
      return Dialogue;
   end Create_Dialogue;
   
   function Get_String_Content(Element: Node) return Unbounded_String is
      Text_Node: Node := First_Child(Element);
      Text_String: DOM_String := Node_Value(Text_Node);
   begin
      return To_Unbounded_String(Text_String);
   end Get_String_Content;
   
end XML_Parser;
