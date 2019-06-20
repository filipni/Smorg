with Rooms, Items;
use Rooms, Items;

package Chambers is
   

   type Chamber is new Room with null record;
   
   function Make return Room_Access;
   function Request_Item(Self: in out Chamber; Item_Name: String; Requested_Item: out Item) return Boolean;
   function Request_Next_Room(Self: Chamber; Room_Direction: Direction; Next_Room: out Room_Access) return Boolean;

end Chambers;
