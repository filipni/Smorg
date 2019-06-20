with Ada.Characters.Handling;
use Ada.Characters.Handling;

package body Input_Parser is
   
   function Parse(Input: String) return Vector is
      Input_String: String := Trim_String(Input) & " ";
      Word_Vector: Vector;
      Word: Unbounded_String;
      Word_Start: Positive := Input_String'First;
   begin
      for i in Input_String'Range loop
         if Input_String(i) = ' ' or i = Input_String'Last then
            Word := To_Unbounded_String(To_Lower(Input_String(Word_Start..i-1)));
            if not Is_Excluded(To_String(Word)) then
               Word_Vector.Append(To_String(Word));
            end if;
            Word_Start := i+1;
         end if;
      end loop;
      
      if Word_Vector.Length = 0 then
         Word_Vector.Append("Empty");
      end if;
      
      return Word_Vector;
   end Parse;
   
   function Is_Excluded(Word: String) return Boolean is 
     (Word = "on" or Word = "with" or Word = "to");
   
end Input_Parser;
