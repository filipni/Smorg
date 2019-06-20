with Text_Adventure;
use Text_Adventure;

-- TODO:
--  * Usable items on self
--  * Make it possible to receive items from NPCs
--  * Get additional info about items when looking at them
--  * Define rooms in XML

procedure Main is
   Running: Boolean := True;
   Game_Session: Game := Text_Adventure.Make;
begin
   while Running loop
      Running := Game_Session.Run;
   end loop;
end Main;
