with Ada.Text_IO;      use Ada.Text_IO;
with Test_Assertions;  use Test_Assertions;
with P3_1;         use P3_1;

procedure Test_P3_1 is
   procedure Test_1 is
      Msg   : constant String := "Test_1: Compare two equal strings";
   begin
      Assert_True (Compare_To ("Programming III", "Programming III"), Msg);
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_1;

   procedure Test_2 is
      Msg   : constant String := "Test_2: Compare two non equal strings";
   begin
      Assert_False (Compare_To ("SPARK 2015", "SPARK 2014"), Msg);
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_2;

   procedure Test_3 is
      Msg   : constant String := "Test_3: Count Lower Elements I";
      Vector1 : Vector := (1, 6);
   begin
      Assert_True(Count_Lower_Elements(Vector1, 5)=1, Msg);
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_3;

   procedure Test_4 is
      Msg   : constant String := "Test_4: Count Lower Elements II";
      Vector1 : Vector := (100,200);
   begin
      Assert_True(Count_Lower_Elements(Vector1, 50)=0, Msg);
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_4;

   procedure Test_5 is
      Msg   : constant String := "Test_5: Count Lower Elements III";
      Vector1 : Vector := (100,200, 2511, 210);
   begin
      Assert_True(Count_Lower_Elements(Vector1, 200)=2, Msg);
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_5;

   procedure Test_6 is
      Msg   : constant String := "Test_6: Delete Elements I";
      Vector1 : Vector := (101,-5,10,200);
      Vector2 : Vector := (-5,10);
   begin
      Assert_True(Delete_Elements(Vector1,100)=Vector2, Msg);
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_6;

   procedure Test_7 is
      Msg   : constant String := "Test_7: Delete Elements II";
      Vector1 : Vector := (50,147);
      Vector2 : Vector := (1 => 50);
   begin
      Assert_True(Delete_Elements(Vector1,100)=Vector2, Msg);
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_7;

   procedure Test_8 is
      Msg   : constant String := "Test_8: Delete Elements III";
      Vector1 : Vector := (1652,1000);
      Vector2 : Vector := (1 => 0);
   begin
      Assert_True(Delete_Elements(Vector1,999)=Vector2, Msg);
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_8;

begin
   Put_Line ("********* Batch Tests *********");
   Test_1;
   Test_2;
   Test_3;
   Test_4;
   Test_5;
   Test_6;
   Test_7;
   Test_8;
end Test_P3_1;
