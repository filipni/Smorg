package body Items is
   
   function String_Sum_Hash(Name: Unbounded_String) return Hash_Type is
      Sum: Hash_Type := 0;
   begin
      for I in 1 .. Length(Name) loop
         Sum := Sum + Hash_Type(Character'Pos(Element(Name, I)));
      end loop;
      return Sum;
   end String_Sum_Hash;
                               
end Items;
