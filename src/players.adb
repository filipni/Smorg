with Ada.Text_IO, Ada.Strings.Unbounded;
use Ada.Text_IO, Ada.Strings.Unbounded;

package body Players is
   
   procedure Set_Location(Self: in out Player; New_Location: Room_Access) is
   begin
      Self.Current_Location := New_Location;
   end Set_Location;
   
   procedure Print_Inventory(Self: Player) is
   begin
      if Self.Inventory.Is_Empty then
         Put_Line("Your inventory is empty.");
      else
         Put_Line("Your inventory contains:");
         for i of Self.Inventory loop
            Put_Line(i.Get_Name);
         end loop;
      end if;
   end Print_Inventory;
   
   procedure Look(Self: Player) is
   begin
      Self.Current_Location.Show_View;
   end Look;
   
   procedure Go(Self : in out Player; Walking_Direction: Direction) is
      New_Room: Room_Access;
      Access_Granted: Boolean := False;
   begin
      Access_Granted := Self.Current_Location.Request_Next_Room(Walking_Direction, New_Room);
      if Access_Granted then
         Self.Current_Location := New_Room;
         Self.Current_Location.Show_View;
      else
         Put_Line("You cannot walk this way.");
      end if;
   end Go;
   
   procedure Take(Self: in out Player; Item_Name: String) is
      Requested_Item: Item;
      Item_Acquired: Boolean := False;
   begin
      Item_Acquired := Self.Current_Location.Request_Item(Item_Name, Requested_Item);
      if Item_Acquired then
         Self.inventory.Insert(To_Unbounded_String(Requested_Item.Get_Name), Requested_Item);
      end if;
   end Take;
   
   procedure Use_Item(Self: in out Player; Item_Name: String; Item_Target: String := "self") is
      Item_Name_Unbounded: Unbounded_String := To_Unbounded_String(Item_Name);
      Success: Boolean := False;
   begin
      if Self.Inventory.Contains(Item_Name_Unbounded) then
         if Item_Target = "self" then
            Success := False; -- not implemented yet
         else
            Success := Self.Current_Location.Try_Item_On_Entity(Item_Name, Item_Target);
            end if;
         if Success then
            Self.Inventory.Delete(Item_Name_Unbounded);
         else
            Put_Line("Failed to use " & Item_Name & ".");
         end if;
      else
         Put_Line("Couldn't find """ & Item_Name & """ in inventory.");
      end if;    
   end Use_Item;
   
   procedure Talk(Self: Player; NPC_Name: String) is
   begin
      Self.Current_Location.Interact_With_NPC(NPC_Name);
   end Talk;
      
   procedure Set_Winning_Condition(Self: in out Player; Item_Name: String) is
   begin
      Self.Winning_Condition := To_Unbounded_String(Item_Name);
   end Set_Winning_Condition;
   
   function Is_A_Winner(Self: Player) return Boolean is
   begin
      return Self.Inventory.Contains(Self.Winning_Condition);
   end Is_A_Winner;

end Players;
