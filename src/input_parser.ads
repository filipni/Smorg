with Ada.Containers.Indefinite_Vectors, Ada.Strings.Unbounded, Ada.Strings;
use Ada.Containers, Ada.Strings.Unbounded, Ada.Strings;

package Input_Parser is

   package String_Vector is new Indefinite_Vectors (Positive, String); 
   use String_Vector;
   
   function Parse(Input: String) return Vector;
   
 private
   
   function Trim_String(S: String) return String is (To_String(Trim(To_Unbounded_String(S), Both)));
   function Is_Excluded(Word: String) return Boolean;

end Input_Parser;
