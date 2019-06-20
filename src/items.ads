with Ada.Containers.Hashed_Maps, Ada.Strings.Unbounded, Entities;
use Ada.Containers, Ada.Strings.Unbounded, Entities;

package Items is

   type Item is new Entity with null record;
   
   function String_Sum_Hash (Name: Unbounded_String) return Hash_Type;
  
   package Item_Map is new Ada.Containers.Hashed_Maps
     (Key_Type        => Unbounded_String,
      Element_Type    => Item,
      Hash            => String_Sum_Hash,
      Equivalent_Keys => "=");

end Items;
