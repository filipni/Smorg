with Ada.Text_IO;
use Ada.Text_IO;

package body NPCs is
   
   procedure Print_Choices(Options: Text_Vector.Vector) is
   begin
      for I in Options.First_Index .. Options.Last_Index loop
         Put_Line(" " & Integer'Image(I) & ". " & To_String(Options.Element(I))); 
      end loop;
   end Print_Choices;
   
   procedure Interact_With(Self: NPC) is
      Root: Tree_Access := Self.Dialogue;
      Num_Children: Integer;
      Input: Character;
      Choice: Integer := 0;
      First_Try: Boolean := True;
   begin
      loop
         Put_Line(To_String(Root.Text));
         
         Num_Children := Integer(Root.Children.Length);
         exit when Num_Children <= 0;
         
         -- Keep asking for input until a valid choice is made.
         while Choice <= 0 or Choice > Num_Children loop
            if First_Try then
               First_Try := False;
            else
               Put_Line(To_String(Root.Text));
            end if;
            Print_Choices(Root.Choices);
            Put("Make your choice: ");
            Get_Immediate(Input);
            if Input in '1'..'9' then
               Choice := Integer'Value((1 => Input)); -- Convert Character to String, and then String to Integer.
            end if;
            Skip_Line;
            New_Line;
         end loop;
         
         Root := Root.Children.Element(Choice);
         First_Try := True;
         choice := 0;
      end loop;
   end Interact_With;
   
end NPCs;
