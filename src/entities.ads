with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Entities is
   
   type Entity is abstract tagged private;
   procedure Set_Name(Self: in out Entity; Name : String);
   function Get_Name(Self: Entity) return String;
   procedure Set_Description(Self: in out Entity; Description : String);
   function Get_Description(Self: Entity) return String;
   
private
   
   type Entity is abstract tagged record
      Name : Unbounded_String;
      Description : Unbounded_String;
   end record;

end Entities;
