with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with P3_1; use P3_1;

package body P3_1 with SPARK_Mode => On is
   function Compare_To (String1 : String; String2 : String) return Boolean is
   begin
      return String1=String2;
   end Compare_To;

   function Delete_Elements (Vector1: Vector; Number: Integer) return Vector is
      Aux_Vector : Vector (0..(Count_Lower_Elements(Vector1, Number)-1)) := (others => 0);
      j : Natural := 0;
   begin
      if Aux_Vector'Length = 0 then
         return (1 => 0);
      end if;
      for i in Vector1'Range loop
         if Vector1(i) <= Number then
            Aux_Vector(j) := Vector1(i);
            j := j + 1;
            if j > Aux_Vector'Last then
               return Aux_Vector;
            end if;
         end if;
         pragma Loop_Invariant (j in Aux_Vector'Range and i in Vector1'Range);
         pragma Loop_Invariant
           (if j /= 0 then
              (for some K in Vector1'First..i => Vector1(K) <= Number)
            else
              (for all K in Vector1'First..i => Vector1(K) > Number));
      end loop;
      return Aux_Vector;
   end Delete_Elements;
                
   function Count_Lower_Elements(Vector1 : Vector; Number: Integer) return Natural is
      Counter : Natural := 0;
   begin
      for i in Vector1'Range loop
         if Vector1(i) <= Number then
            Counter := Counter + 1;
         end if;
         pragma Loop_Invariant (I < Max and Counter in 0..i+1);
         pragma Loop_Invariant
           (if Counter /= 0 then
              (for some K in Vector1'First..i => Vector1(K) <= Number)
            else
              (for all K in Vector1'First..i => Vector1(K) > Number));
      end loop;
      return Counter;
   end Count_Lower_Elements;
 
end P3_1;
