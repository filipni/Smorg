with XML_Parser; 
use XML_Parser;

package body Monsters is
   
   function Make return NPC_Access is
      Self: NPC_Access := new Monster;
   begin
      Self.Set_Name("creature");
      Self.Set_Description("You can see a strange creature lurking in one of the coners.");
      Self.Dialogue := Create_Dialogue_Tree_From_XML_File("dialogue.xml");
      return Self;
   end Make;
   
end Monsters;
