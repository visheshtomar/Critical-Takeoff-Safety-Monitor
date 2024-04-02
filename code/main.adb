pragma SPARK_Mode (On);
with takeoff_control; use takeoff_control;

procedure Main is
begin
   Init;
   loop
   pragma Loop_Invariant(Is_Safe(takeoff_status));
   Read_Arguments;
   Monitor_Runway;
   Print_Status;
   end loop;
end Main;
