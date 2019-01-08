package P3_1 with SPARK_Mode => ON is
   Max : constant := 1000;

   type Vector is array(Natural range <>) of Integer;

   function Compare_To
     (String1: String;
      String2: String) return Boolean
     with Global => null,
          Depends => (Compare_To'Result => (String1, String2)),
          Pre => True,
          Post => (if String1 = String2 then Compare_To'Result = True);

   function Count_Lower_Elements(Vector1 : Vector; Number: Integer) return Natural
     with Global => null,
          Depends => (Count_Lower_Elements'Result => (Vector1, Number)),
          Pre => Vector1'Length < Max
                 and then Vector1'First = 0,
          Post =>  ((Count_Lower_Elements'Result = 0) =
                    (for all K in Vector1'Range => Vector1(K) > Number));

   function Delete_Elements (Vector1: Vector; Number: Integer) return Vector
     with Global => null,
          Depends => (Delete_Elements'Result => (Vector1, Number)),
          Pre => Vector1'Length < Max
                 and then Vector1'First = 0,
          Post => (if Delete_Elements'Result'Length = 0 then
                    (for all K in Vector1'Range => Vector1(K) > Number)) or
                      (if Delete_Elements'Result'Length > 0 then
                        (for some K in Vector1'Range => Vector1(K) <= Number));
end P3_1;
