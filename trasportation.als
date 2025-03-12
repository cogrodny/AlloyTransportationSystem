sig Person {}

sig Material {}

abstract sig Location {}
sig Dwelling extends Location {}
sig Warehouse extends Location {}
sig Workplace extends Location {}

abstract sig Vehicle {}
sig PassengerVehicle extends Vehicle {}
sig CargoVehicle extends Vehicle {}

run example {}