// Signatures
sig Person {}

sig Material {}

abstract sig Location {}
sig Dwelling extends Location {
    var people : set Person
}
sig Warehouse extends Location {
    var supplies : set Material
}
sig Workplace extends Location {
    var workers : set Person,
    var materials : set Material,
    people_needed : Int,
    materials_needed : Int
}

abstract sig Vehicle {}
sig PassengerVehicle extends Vehicle {
    var passengers : set Person,
    max_passengers : Int
}
sig CargoVehicle extends Vehicle {
    var cargo : set Material,
    max_cargo : Int
}

// Facts
fact {
    // PassengerVehicle cannot have the number of passengers exceed its max_passengers
    always all p : PassengerVehicle | #p.passengers <= p.max_passengers
}
fact {
    // max_passengers is always greater than 0
    all p : PassengerVehicle | p.max_passengers > 0
}


fact {
    // CargoVehicle cannot have the number of cargo exceed its max_cargo
    always all c : CargoVehicle | #c.cargo <= c.max_cargo
}
fact {
    // max_cargo is always greater than 0
    all c : CargoVehicle | c.max_cargo > 0
}


fact {
    // Person can only have 1 parent (Vehicle/Location)
    always all p : Person | lone (p.(~passengers) + p.(~people) + p.(~workers))
}
fact {
    // Material can only have 1 parent (Vehicle/Location)
    always all m : Material | lone (m.(~cargo) + m.(~supplies) + m.(~materials))
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
pred loadCargo [w: Warehouse, c: CargoVehicle, m: Material] {
    // Moves Materials from Warehouse to CargoVehicle
    m in w.supplies
    m not in c.cargo
    w.supplies' = w.supplies - m
    c.cargo' = c.cargo + m
}

pred unloadCargo [c: CargoVehicle, w: Workplace, m: Material] {
    // Moves Materials from CargoVehicle to Workplace
    m in c.cargo
    m not in w.materials
    c.cargo' = c.cargo - m
    w.materials' = w.materials + m
}

pred loadPeople [d: Dwelling, p: PassengerVehicle, person: Person] {
    // Moves Persons from Dwelling to PassengerVehicle
    person in d.people
    person not in p.passengers
    d.people' = d.people - person
    p.passengers' = p.passengers + person
}

pred unloadPeople [p: PassengerVehicle, w: Workplace, person: Person] {
    // Moves Persons from PassengerVehicle to Workplace
    person in p.passengers
    person not in w.workers
    p.passengers' = p.passengers - person
    w.workers' = w.workers + person
}

pred completeJob [w: Workplace] {
    // Deletes Job/Workplace(?) after conditions for job are met
}

// Run
run {} 