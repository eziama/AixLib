within AixLib.Systems.HeatPumpSystems.BaseClasses;
record HeatPumpSystemParameters
  "Parameters for design point of a heat pump system"
  parameter Modelica.SIunits.HeatFlowRate QCon_nominal
    "Nominal heating power of heat pump" annotation (Dialog(group="Design"));
  parameter Modelica.SIunits.Power P_el_nominal "Nominal electrical power, used for calculating nominal evaporator heat flow" annotation (Dialog(group="Design"));

  parameter Modelica.SIunits.ThermodynamicTemperature TCon_nominal=308.15
    "Nominal supply temperatur of the condenser" annotation (Dialog(group="Design"));
  parameter Modelica.SIunits.ThermodynamicTemperature TEva_nominal=283.15
    "Nominal supply temperatur of the evaporator" annotation (Dialog(group="Design"));
  parameter Modelica.SIunits.TemperatureDifference dTEva=3
    "Temperature difference at the evaporator" annotation (Dialog(group="Design"));
  parameter Modelica.SIunits.TemperatureDifference dTCon=5
    "Temperature difference at the condenser" annotation (Dialog(group="Design"));
  parameter Modelica.SIunits.TemperatureDifference dTPinchEva=8
    "Pinch temperature in the evaporator" annotation (Dialog(group="Design"));
  parameter Modelica.SIunits.TemperatureDifference dTPinchCon=8
    "Pinch temperature in the condenser" annotation (Dialog(group="Design"));

  parameter Real percHeatLoss=0.1
    "Percentage of heat losses in the heat exchangers to the nominal heating power" annotation (Dialog(group="Design"));
protected
  parameter Modelica.SIunits.HeatFlowRate QEva_nominal = QCon_nominal-P_el_nominal;
end HeatPumpSystemParameters;