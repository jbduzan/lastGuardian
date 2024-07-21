extends Node2D

@onready var spawner: SpawnerComponent = $SpawnerComponent

func _process(delta):
	rotation = global_position.angle_to_point(get_global_mouse_position())

func shoot():
	spawner.spawnWithDirection(get_global_mouse_position(), $weaponMuzzle.global_position)
	