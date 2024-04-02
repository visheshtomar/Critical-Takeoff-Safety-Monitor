pragma SPARK_Mode (On);

with AS_IO_Wrapper;  use AS_IO_Wrapper; 


package body takeoff_control is
   
   procedure Read_Arguments is
      weight : Integer;
      fuel : Integer;
   begin
      AS_Put_Line("Please type in Weight");
      loop
         AS_Get(weight,"Please type in an integer for weight");
         AS_Get(fuel, "Please type in an integer for fuel");
         exit when (weight >=0) and (weight <= Maximum_weight) and (fuel >= 0) and (fuel < Maximum_fuel);
         AS_Put("Wrong Input!! Please enter input in range weight(0-1000) ");
         AS_Put_Line(" ");
      end loop;
      takeoff_status.weight_measured := Weight_range(weight);
      takeoff_status.fuel_measured := fuel_range(fuel);
   end Read_Arguments;
   
   function Status_takeoff_tostring (Status_takeoff_control   : takeoff_status_type) return String is
   begin
      if (Status_takeoff_control.Status_takeoff = Permitted) 
      then return "takeoff is Permitted";
      else return "takeoff is Denied";
      end if;
   end Status_takeoff_tostring;
   
   procedure Monitor_Runway is 
   begin
      if Integer(takeoff_status.weight_measured) > Threshold_Plane_Weight or Integer(takeoff_status.fuel_measured) < Threshold_fuel
      then takeoff_status.Status_takeoff := Denied;
      else takeoff_status.Status_takeoff := Permitted;
      end if;
   end Monitor_Runway;
   
   procedure Print_Status is 
   begin
      AS_Put("total weight =");
      AS_Put(Integer(takeoff_status.weight_measured));
      AS_Put_Line(" ");
      AS_Put("fuel");
      AS_Put(Integer(takeoff_status.fuel_measured));
      AS_Put_Line(Status_takeoff_tostring(takeoff_status));
   end Print_Status;
   
         
   
   procedure Init is 
   begin
      AS_Init_Standard_Input;
      AS_Init_Standard_Output;
      takeoff_status := ( weight_measured => 0,
                          fuel_measured => 1100,
                          Status_takeoff => Permitted);
   end Init;
   
      
     
end takeoff_Control;
	


