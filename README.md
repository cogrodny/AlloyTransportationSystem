# Project 2 - Team 3

Transportation system structurally modelled using Alloy.

## Requirements

### Phase 1: Structural Aspects

Use Alloy signatures to model:

- people
- materials
- locations
  - dwellings
  - warehouses
  - workplaces
- vehicles
  - passenger vehicles
  - cargo vehicles

Passenger vehicles have a maximum number of seats, and cargo vehicles have a maximum capacity.

Each workplace specifies a certain number of people and materials required to complete the work.

**Phase goal**: Should be able to generate and visualize initial configurations

### Phase 2: Dynamic Aspects

Once we have a structural design, we'll define some actions, such as:

- moving people and cargo (consistent with vehicle capacity)
- completing (deleting) a job after at least the required number of people and amount of materials have arrived at the corresponding workplace

**Phase goal**: Should be able to determine whether it is feasible to get the work done for certain initial configurations
