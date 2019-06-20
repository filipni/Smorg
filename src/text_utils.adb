with Ada.Characters.Latin_1, Ada.Text_IO;
use Ada.Characters.Latin_1, Ada.Text_IO;

package body Text_Utils is
   
   function Line_Break return String is
   begin
      return CR & LF;
   end Line_Break;
   
   procedure Put_Line(Text: Unbounded_String) is
   begin
      Put_Line(To_String(Text));
   end Put_Line;
   
end Text_Utils;
