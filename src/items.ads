with Ada.Containers.Hashed_Maps, Ada.Strings.Unbounded, Ada.Strings.Unbounded.Hash, Entities;
use Ada.Containers, Ada.Strings.Unbounded, Entities;

package Items is

   type Item is new Entity with null record;
   
   package Item_Map is new Ada.Containers.Hashed_Maps
     (Key_Type        => Unbounded_String,
      Element_Type    => Item,
      Hash            => Hash,
      Equivalent_Keys => "=");

end Items;
