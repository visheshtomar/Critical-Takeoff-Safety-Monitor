# Critical-Takeoff-Safety-Monitor
The aim of this project is to develop a critical system for aircraft takeoff management, ensuring safe takeoffs by evaluating the aircraft's fuel capacity relative to its loaded weight, while considering maximum capacity limitations.


### How It Works
The system interacts with security personnel to input the total weight of the aircraft and its current fuel level. Based on these inputs, it provides feedback on whether the aircraft is ready for takeoff.

#### User Inputs
- **Weight**: The total weight of the aircraft, including cargo and passengers.
- **Fuel**: The current fuel level in the aircraft.

These inputs are validated against predefined maximum and minimum thresholds to ensure they are within safe operational parameters.

#### Global Variables
- `takeoff_status`: Holds the current weight and fuel status of the aircraft.

### Components

#### Procedures
- `Read_Arguments`: Captures user inputs.
- `Monitor_Runway`: Compares inputs against system thresholds.
- `Print_Status`: Outputs the takeoff decision.
- `Init`: Initializes global variables.

#### Functions
- `Status_takeoff_tostring`: Displays the takeoff status on the console.
- `Is_Safe`: Determines the safety of the takeoff.

### System Architecture
The program is structured across four main files:
- `Main.adb`: Contains the main procedure packages.
- `Main.gpr`: The executable file for running the program.
- `Takeoff_control.adb`: Initializes system values.
- `Takeoff_control.ads`: Handles the implementation process.

### Hazard Analysis
The system employs Fault Tree Analysis (FTA) to identify potential failure points, thereby enhancing the system's reliability and safety.

### Output
The system provides feedback based on the input parameters, indicating whether the aircraft is ready for takeoff or if there are issues that need to be addressed.

#### Example Outputs
- Error messages for values exceeding system limits.
- Denial of permission for values below minimum thresholds.
- Permission granted for takeoff when all conditions are satisfactorily met.
