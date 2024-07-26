extends Node2D

@onready var spawner: SpawnerComponent = $bulletSpawner
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
	var weapon = load("res://player/specialWeapons/heartSeekingMissile.tscn").instantiate()
	$specialWeaponSpawner.scene = load("res://player/specialWeapons/heartSeekingMissile.tscn")
	weapon.weaponMuzzlePosition = $weaponMuzzle/muzzleCenter.global_position
	add_child(weapon)
	weapon.shoot($specialWeaponSpawner)
	$specialWeaponSpawner.scene = null
