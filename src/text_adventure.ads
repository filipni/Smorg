with Players, Rooms, Prisons, Dungeons, Chambers;
use Players, Rooms, Prisons, Dungeons, Chambers;

package Text_Adventure is
   
   type Game is tagged record
      Prison: Room_Access := Prisons.Make;
      Prison_Dungeon: Room_Access := Dungeons.Make;
      Treasure_Chamber: Room_Access := Chambers.Make;
      The_Player: Player;
   end record;
   
   function Make return Game;
   
   function Run(Self: in out Game) return Boolean;
   
end Text_Adventure;
