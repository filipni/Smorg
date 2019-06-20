with Rooms, Items;
use Rooms, Items;

package Dungeons is

   type Dungeon is new Room with null record;
   
   function Make return Room_Access;
   function Request_Item(Self: in out Dungeon; Item_Name: String; Requested_Item: out Item) return Boolean;
   function Request_Next_Room(Self: Dungeon; Room_Direction: Direction; Next_Room: out Room_Access) return Boolean;

end Dungeons;
