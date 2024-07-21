# Give the component a class name so it can be instanced as a custom node
class_name StatsComponent
extends Node

# Create the health variable and connect a setter
@export var health: int = 1:
	set(value):
		health = value
		health_changed.emit()
		if health == 0: no_health.emit()

@export var xp: int = 1
@export var lvl: int = 1

# Create our signals for health
signal health_changed() # Emit when the health value has changed
signal no_health() # Emit when there is no health left
