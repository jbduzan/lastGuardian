extends Node2D

@onready var spawner: SpawnerComponent = $SpawnerComponent
@onready var scaler: ScaleComponent = $ScaleComponent

func _process(delta):
	rotation = global_position.angle_to_point(get_global_mouse_position())

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shootSpecialWeapon()

func shoot(numberOfShoot: int):
	if numberOfShoot == 1 or numberOfShoot == 3:
		spawner.spawnWithRotation(rotation, $weaponMuzzle/muzzleCenter.global_position)
	
	if numberOfShoot >= 2:
		spawner.spawnWithRotation(rotation, $weaponMuzzle/muzzleTop.global_position)
		spawner.spawnWithRotation(rotation, $weaponMuzzle/muzzleBottom.global_position)
		
	scaler.tween_scale()
	
func shootSpecialWeapon():
	var enemies = get_tree().get_nodes_in_group("enemies")
	enemies.sort_custom(func(a, b):
		var distanceA = a.position.distance_to(global_position)
		var distanceB = b.position.distance_to(global_position)
		return distanceA < distanceB
	)
	
	for i in range(10):
		var target = enemies.pop_front()
		
		if target:
			var targetRotation = global_position.angle_to_point(target.position)
			spawner.spawnWithRotation(targetRotation, $weaponMuzzle/muzzleCenter.global_position)
