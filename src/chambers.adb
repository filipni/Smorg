with Ada.Text_IO, Ada.Strings.Unbounded, Text_Utils;
use Ada.Text_IO, Ada.Strings.Unbounded, Text_Utils;

package body Chambers is
   function Make return Room_Access is
      Self: Room_Access := new Chamber;
      Ruby: Item;
   begin
      Self.Set_Name("Treasure Chamber");
      Self.Set_Description("Blinded by a sparkling light, you walk into a room coverd from top to bottom in riches." & Line_Break &
                             "The center piece of this oasis of gold, is an old altar.");
      Ruby.Set_Name("ruby");
      Ruby.Set_Description("A ruby with a dark red color lies on the altar.");
      Self.Inventory.Insert(To_Unbounded_String(Ruby.Get_Name), Ruby);
      return Self;
   end Make;
   
   function Request_Item(Self: in out Chamber; Item_Name: String; Requested_Item: out Item) return Boolean is
      Item_Name_Unbounded: Unbounded_String := To_Unbounded_String(Item_Name);
   begin
      if Self.Inventory.Contains(Item_Name_Unbounded) then
         Requested_Item := Self.Inventory.Element(Item_Name_Unbounded);
         Self.Inventory.Delete(Item_Name_Unbounded);
         Put_Line("The ground starts to rumble as you pick up the ruby." & Line_Break &
                    "The walls of the old castle seem to fade away." & Line_Break &
                    "Your quest is completed!");
         return True;
      end if;
      Put_Line("Could not find """ & Item_Name & """");
      return False;
   end Request_Item;

function Request_Next_Room(Self: Chamber; Room_Direction: Direction; Next_Room: out Room_Access) return Boolean is
begin
   case Room_Direction is
      when west =>
         Next_Room := Self.Neighbours(west);
         return True;
      when others => return False;
   end case;
end Request_Next_Room;
   
end Chambers;
