with Ada.Text_IO, Ada.Strings.Unbounded, Items, Monsters, NPCs, Text_Utils;
use Ada.Text_IO, Ada.Strings.Unbounded, Items, Monsters, NPCs, Text_Utils;

package body Prisons is
   
   function Request_Next_Room(Self: Prison; Room_Direction: Direction; Next_Room: out Room_Access) return Boolean is
   begin
      case Room_Direction is
         when north => 
            if Self.Door_Is_Locked then 
               Put_Line("The door is locked.");
               return False;
            else
               Next_Room := Self.Neighbours(north);
               return True;
            end if;
         when others => 
            return False;
      end case;
   end Request_Next_Room;
   
   function Make return Room_Access is
      Self: Room_Access := new Prison;
      Key: Item;
      Slime: NPC_Access := Make;
   begin
      Self.Set_Name("Prison Cell");
      Self.Set_Description("You're standing in an old prison cell." & Line_Break &
                               "Moonlight seeps through a barred window." & Line_Break &
                               "A robust metal door can be found on the north side.");
      Key.Set_Name("key");
      Key.Set_Description("A dusty key lies on the floor."); 
      Self.Inventory.Insert(To_Unbounded_String(Key.Get_Name), Key);
      
      Self.Inhabitants.Insert(To_Unbounded_String(Slime.Get_Name), Slime);
      return Self;
   end Make;
   
   function Request_Item(Self: in out Prison; Item_Name: String; Requested_Item: out Item) return Boolean is
      Item_Name_Unbounded: Unbounded_String := To_Unbounded_String(Item_Name);
   begin
      if Self.Inventory.Contains(Item_Name_Unbounded) then
         Requested_Item := Self.Inventory.Element(Item_Name_Unbounded);
         Self.Inventory.Delete(Item_Name_Unbounded);
         Put_Line("You brush off the key and put it in your pocket.");
         return True;
      end if;
      Put_Line("Could not find """ & Item_Name & """");
      return False;
   end Request_Item;
   
   function Try_Item_On_Entity(Self: in out Prison; Item_Name: String; Entity_Name: String) return Boolean is
   begin
      if Item_Name = "key" and then Entity_Name = "door" then
         Self.Door_Is_Locked := False;
         Put_Line("You unlock the door with the key.");
         return True;
      end if;
      return False;
   end Try_Item_On_Entity;
   
   procedure Interact_With_NPC(Self: Prison; Occupant_Name: String) is
      Occupant_Name_Unbounded: Unbounded_String := To_Unbounded_String(Occupant_Name);
      Occupant: NPC_Access;
   begin
      if Self.Inhabitants.Contains(Occupant_Name_Unbounded) then
         Occupant := Self.Inhabitants(Occupant_Name_Unbounded);
         Occupant.Interact_With;
      else
         Put_Line("Can't talk to """ & Occupant_Name & """."); 
      end if;
   end Interact_With_NPC;
   
end Prisons;
