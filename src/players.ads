with Rooms, Items, Ada.Strings.Unbounded;
use Rooms, Items, Ada.Strings.Unbounded;

package Players is

   type Player is tagged private;
   
   procedure Set_Location(Self : in out Player; New_Location: Room_Access);
   procedure Print_Inventory(Self: Player);
   
   procedure Look(Self: Player);
   procedure Go(Self: in out Player; Walking_Direction: Direction);
   procedure Take(Self: in out Player; Item_Name: String);
   procedure Use_Item(Self: in out Player; Item_Name: String; Item_Target: String := "self");
   procedure Talk(Self: Player; NPC_Name: String);
   
   procedure Set_Winning_Condition(Self: in out Player; Item_Name: String);
   function Is_A_Winner(Self: Player) return Boolean;
   
private
   
   type Player is tagged record
      Current_Location : Room_Access;
      Inventory: Item_Map.Map;
      Winning_Condition: Unbounded_String;
   end record;

end Players;
