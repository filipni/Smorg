with NPCs; 
use NPCs; 

package Monsters is
   
   type Monster is new NPC with null record;
   
   function Make return NPC_Access;
      
end Monsters;
