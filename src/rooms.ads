with Entities, Items, NPCs; 
use Entities, Items, NPCs;

package Rooms is
   
   type Direction is (north, south, west, east);
   
   type Room;
   type Room_Access is access Room'Class;
   type Room_Array is array (Direction) of Room_Access;
   
   type Room is abstract new Entity with record
      Neighbours: Room_Array;
      Inventory: Item_Map.Map;
      Inhabitants: NPC_Map.Map;  
   end record;
   
   function Make return Room_Access is abstract;
   function Request_Item(Self: in out Room; Item_Name: String; Requested_Item: out Item) return Boolean is abstract;
   function Request_Next_Room(Self: Room; Room_Direction: Direction; Next_Room: out Room_Access) return Boolean is abstract;
   function Try_Item_On_Entity(Self: in out Room; Item_Name: String; Entity_Name: String) return Boolean;
   
   procedure Show_View(Self: Room);
   procedure Interact_With_NPC(Self: Room; NPC_Name: String);
   
end Rooms;
