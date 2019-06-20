with Ada.Text_IO, Input_Parser;
use Ada.Text_IO, Input_Parser;

package body Text_Adventure is
   
   function Make return Game is
      Self: Game; 
   begin
      Self.Prison.Neighbours(north) := Self.Prison_Dungeon;
      Self.Prison_Dungeon.Neighbours(south) := Self.Prison;
      Self.Prison_Dungeon.Neighbours(east) := Self.Treasure_Chamber;
      Self.Treasure_Chamber.Neighbours(west) := Self.Prison_Dungeon;
      Self.The_Player.Set_Location(Self.Prison);
      Self.THe_Player.Set_Winning_Condition("ruby");
      Self.The_Player.Look;
      return Self;
   end Make;
   
   function Get_Input return String is
      Text_Input: String(1..20);
      Last: Positive;
   begin
      loop
         begin
            Put("Command: ");
            Get_Line(Text_Input, Last);
            New_Line;
            return Text_Input(Text_Input'First..Last);
         exception
            when Error : Constraint_Error =>
               Put_Line("Invalid input");
               New_Line;
         end;
      end loop;
   end Get_Input;
   
   function Run(Self: in out Game) return Boolean is
      Text_Input: String := Get_Input;
      Words: Input_Parser.String_Vector.Vector := Parse(Text_Input);
      Num_Words: Integer := Integer(Words.Length);
      Verb: String := Words.Element(1); 
      Walking_Direction: Direction;
      Game_Is_Running: Boolean := True;
   begin
      if Verb = "look" then
         if Num_Words = 2 and then Words.Element(2) = "inventory" then
            Self.The_Player.Print_Inventory;
         else
            Self.The_Player.Look;
         end if;
      elsif Verb = "go" then
         begin
            Walking_Direction := Direction'Value(Words.Element(2));
            Self.The_Player.Go(Walking_Direction);
         exception
            when Constraint_Error =>
               Put_Line("Invalid direction");
         end;
      elsif Verb = "take" and Num_Words = 2 then
         Self.The_Player.Take(Words.Element(2));      
      elsif Verb = "use" then
         if Num_Words = 2 then
            Self.The_Player.Use_Item(Words.Element(2));
         elsif Num_Words = 3 then
            Self.The_Player.Use_Item(Item_Name => Words.Element(2), Item_Target => Words.Element(3));
         end if;
      elsif Verb = "talk" and Num_Words = 2 then
         Self.The_Player.Talk(Words.Element(2));
      elsif Verb = "quit" or verb = "exit" then
         Game_Is_Running := False;
      end if;
      return Game_Is_Running and not Self.The_Player.Is_A_Winner;
   end Run;
   
end Text_Adventure;
