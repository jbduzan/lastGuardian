extends Node2D

@onready var spawner: SpawnerComponent = $bulletSpawner
@onready var scaler: ScaleComponent = $ScaleComponent

func _process(delta):
	rotation = global_position.angle_to_point(get_global_mouse_position())

func shoot(numberOfShoot: int):
	if numberOfShoot == 1 or numberOfShoot == 3:
		spawner.spawnWithRotation(rotation, $weaponMuzzle/muzzleCenter.global_position)
	
	if numberOfShoot >= 2:
		spawner.spawnWithRotation(rotation, $weaponMuzzle/muzzleTop.global_position)
		spawner.spawnWithRotation(rotation, $weaponMuzzle/muzzleBottom.global_position)
		
	scaler.tween_scale()
	
func shootSpecialWeapon(weaponName: String):
	var scene = load("res://player/specialWeapons/" + weaponName + ".tscn")
	
	if scene:
		var weapon = scene.instantiate()
		$specialWeaponSpawner.scene = scene
		weapon.weaponMuzzlePosition = $weaponMuzzle/muzzleCenter.global_position
		add_child(weapon)
		weapon.shoot($specialWeaponSpawner)
		$specialWeaponSpawner.scene = null
	
