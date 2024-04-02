pragma SPARK_Mode (On);
with SPARK.Text_IO; use SPARK.Text_IO;


package takeoff_control is 
   --Globals
   -- Maximum Value for Wind_Speed and Visiblity 
   Maximum_weight : constant Integer := 10000;
   Maximum_fuel : constant Integer := 5000 ;
   
   -- Critical Values for Wind_Speed and Visiblity !! 
   --System will deny landing when the wind-speed is above the threshold and visiblity is below threshold
   
   Threshold_Plane_Weight : constant Integer := 7000;
   Threshold_fuel: constant Integer := 1000;
   type Weight_range is new Integer range 0 .. Maximum_weight;
   type fuel_range is new Integer range 0 .. Maximum_fuel;
   
   -- Creating a type for landing permission that has permitted and denied as its values
   type takeoff_permision is (Permitted, Denied);
   
   -- creating a type for runway status that has wind speed , visiblity and landing control status
   type takeoff_status_type is 
      record
         weight_measured: Weight_range;
         fuel_measured: fuel_range;
         Status_takeoff: takeoff_permision;
      end record;
   -- creating a variable for the previous definded runway status
   takeoff_status : takeoff_status_type;
   
   -- procedure that takes arguments from the user 
   procedure Read_Arguments with 
     Global => (In_Out => (Standard_Output, Standard_Input, takeoff_status)),
     Depends => (Standard_Output => (Standard_Output, Standard_Input), 
                 Standard_Input => Standard_Input, 
                 takeoff_status => (takeoff_status, Standard_Input));
   function Status_takeoff_tostring (Status_takeoff_control   : takeoff_status_type) return String;
   procedure Print_Status with
     Global => (In_Out => Standard_Output,
                Input => takeoff_status),
     Depends => (Standard_Output => (Standard_Output, takeoff_status));
   
   
   function Is_Safe (Status : takeoff_status_type) return Boolean is
     (if Integer(Status.weight_measured) > Threshold_Plane_Weight or Integer(status.fuel_measured) < Threshold_fuel     
      then Status.Status_takeoff = Denied
      else Status.Status_takeoff = Permitted);
      


   --procedure that initialize the variable
   procedure Init with 
     Global => (Output => (Standard_Output, Standard_Input, takeoff_status)),
     Depends => ((Standard_Output, Standard_Input, takeoff_status) => null),
     Post => Is_Safe(takeoff_status);

     
   
   procedure Monitor_Runway with
     Global => (In_Out  => takeoff_status),
     Depends => (takeoff_status => takeoff_status),
     Post    => Is_Safe(takeoff_status);
end takeoff_control;

