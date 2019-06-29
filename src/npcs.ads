with Entities, Items, Ada.Strings.Unbounded, Dialogue_Tree, Ada.Containers.Hashed_Maps, Items;
use Entities, Items, Ada.Strings.Unbounded, Dialogue_Tree, Ada.Containers, Items;

package NPCs is
   
   type NPC is abstract new Entity with record
      Inventory: Item_Map.Map;
      Dialogue: Tree_Access;
   end record;
   type NPC_Access is access NPC'Class;

   package NPC_Map is new Ada.Containers.Hashed_Maps
     (Key_Type        => Unbounded_String,
      Element_Type    => NPC_Access,
      Hash            => String_Sum_Hash,
      Equivalent_Keys => "=");
   
   function Make return NPC_Access is abstract;
     
   procedure Interact_With(Self: NPC);   
   
private
   
   procedure Print_Choices(Options: Text_Vector.Vector);

end NPCs;
