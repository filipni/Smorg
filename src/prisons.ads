with Rooms, Items;
use Rooms, Items;

package Prisons is

   type Prison is new Room with private;
   
   function Make return Room_Access;
   
overriding
   function Request_Item(Self: in out Prison; Item_Name: String; Requested_Item: out Item) return Boolean;
   function Request_Next_Room(Self: Prison; Room_Direction: Direction; Next_Room: out Room_Access) return Boolean;
   function Try_Item_On_Entity(Self: in out Prison; Item_Name: String; Entity_Name: String) return Boolean;
   
   procedure Interact_With_NPC(Self: Prison; Occupant_Name: String);  
   
private
   
   type Prison is new Room with record
      Door_Is_Locked: Boolean := True;
   end record;

end Prisons;
