with Text_Utils;
use Text_Utils;

package body Dungeons is
   
   function Request_Next_Room(Self: Dungeon; Room_Direction: Direction; Next_Room: out Room_Access) return Boolean is
   begin
      case Room_Direction is
         when south => 
            Next_Room := Self.Neighbours(south);
         when east =>
            Next_Room := Self.Neighbours(east);
         when others => return False;
      end case;
      return True;
   end Request_Next_Room;
   
   function Make return Room_Access is
      Self: Room_Access := new Dungeon;
   begin
      Self.Set_Name("Prison Dungeon");
      Self.Set_Description(
                        "The bones from old prisoners crunch under your feet as you enter the room." & Line_Break &
                          "Darkness surrounds you, but there is light to the east.");
      return Self;
   end Make;
   
   function Request_Item(Self: in out Dungeon; Item_Name: String; Requested_Item: out Item) return Boolean is
   begin
     Requested_Item.Set_Name("No Item");
     return False;
   end Request_Item;
      
end Dungeons;
