// Signatures
sig Person {}

sig Material {}

abstract sig Location {}
sig Dwelling extends Location {
    people : set Person
}
sig Warehouse extends Location {
    supplies : set Material
}
sig Workplace extends Location {
    workers : set Person,
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
    all p : PassengerVehicle | #p.passengers <= p.max_passengers
}
fact {
    // max_passengers is always greater than 0
    all p : PassengerVehicle | p.max_passengers > 0
}


fact {
    // CargoVehicle cannot have the number of cargo exceed its max_cargo
    all c : CargoVehicle | #c.cargo <= c.max_cargo
}
fact {
    // max_cargo is always greater than 0
    all c : CargoVehicle | c.max_cargo > 0
}


fact {
    // Person can only have 1 parent (Vehicle/Location)
    all p : Person | lone (p.(~passengers) + p.(~people) + p.(~workers))
}
fact {
    // Material can only have 1 parent (Vehicle/Location)
    all m : Material | lone (m.(~cargo) + m.(~supplies) + m.(~materials))
}

fact {
    // people_needed is always greater than 0
    all w : Workplace | w.people_needed > 0
}
fact {
    // materials_needed is always greater than 0
    all w : Workplace | w.materials_needed > 0
}


// Predicates
pred loadCargo [w: Warehouse, c: CargoVehicle] {
    // Moves Materials from Warehouse to CargoVehicle
}

pred unloadCargo [c: CargoVehicle, w: Workplace] {
    // Moves Materials from CargoVehicle to Workplace
}

pred loadPeople [d: Dwelling, p: PassengerVehicle] {
    // Moves Persons from Dwelling to PassengerVehicle
}

pred unloadPeople [p: PassengerVehicle, w: Workplace] {
    // Moves Persons from PassengerVehicle to Workplace
}

pred completeJob [w: Workplace] {
    // Deletes Job/Workplace(?) after conditions for job are met
}

// Run
run {}