// Signatures
sig Person {}

sig Material {}

abstract sig Location {}
sig Dwelling extends Location {
    people : set Person
}
sig Warehouse extends Location {
    cargo : set Material
}
sig Workplace extends Location {
    people : set Person,
    materials : set Material,
    people_needed : Int,
    materials_needed : Int
}

abstract sig Vehicle {}
sig PassengerVehicle extends Vehicle {
    passengers : set Person,
    max_passengers : Int
}
sig CargoVehicle extends Vehicle {
    cargo : set Material,
    max_cargo : Int
}

// Facts
fact {
    // PassengerVehicle cannot have the number of passengers exceed its max_passengers
}

fact {
    // CargoVehicle cannot have the number of cargo exceed its max_cargo
}

fact {
    // Person can only have 1 parent (Vehicle/Location)
}

fact {
    // Material can only have 1 parent (Vehicle/Location)
}

run example {}