with Ada.Text_IO; 
use Ada.Text_IO;

package body Rooms is
   
   procedure Show_View(self: Room) is
   begin
      Put_Line(self.Get_Description);
      for i of self.Inventory loop
         Put_Line(i.Get_Description);
      end loop;
      for i of self.Inhabitants loop
         Put_Line(i.Get_Description);
      end loop;
   end Show_View;
   
   procedure Interact_With_NPC(Self: Room; NPC_Name: String) is
   begin
      Put_Line("There's no one to interact with.");
   end Interact_With_NPC;
   
   function Try_Item_On_Entity(Self: in out Room; Item_Name: String; Entity_Name: String) return Boolean is  
   begin
      Put_Line("Try_Item_On_Occupant not implemented.");
      return False;
   end Try_Item_On_Entity;
   
end Rooms;
