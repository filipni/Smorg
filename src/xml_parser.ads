with Dialogue_Tree, Ada.Strings.Unbounded, DOM.Core;
use Dialogue_Tree, Ada.Strings.Unbounded, DOM.Core;

package XML_Parser is

   procedure Flatten_File(Filename: String);
   
   function Create_Dialogue_Tree_From_XML_File(Filename: String) return Tree_Access;
   function Add_To_Filename(Filename: String; Addition: String) return String;
   function Create_Dialogue(Root_Element: Node) return Tree_Access;
   function Get_String_Content(Element: Node) return Unbounded_String;
   
end XML_Parser;
