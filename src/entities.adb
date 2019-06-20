package body Entities is

   procedure Set_Name(Self: in out Entity; Name: String) is
   begin
      Self.Name := To_Unbounded_String(Name);
   end Set_Name;

   function Get_Name(Self: Entity) return String is
   begin
      return To_String(Self.Name);
   end Get_Name;

   procedure Set_Description(Self: in out Entity; Description: String) is
   begin
      Self.Description := To_Unbounded_String(Description);
   end Set_Description;

   function Get_Description(Self: Entity) return String is
   begin
      return To_String(Self.Description);
   end Get_Description;

end Entities;
