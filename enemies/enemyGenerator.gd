extends Node2D

@onready var spawn_timer = $spawnTimer
@onready var spawner_component = $SpawnerComponent as SpawnerComponent

@export var playerPosition: Vector2
@export var enemyTypes: Array[PackedScene]

func _on_spawn_timer_timeout():
	var rand_index:int = randi() % enemyTypes.size()
	
	if enemyTypes[rand_index]:
		var enemy = enemyTypes[rand_index]
		handleSpawn(enemy)
		
func handleSpawn(enemyScene: PackedScene):
	var enemySpawnLocation = $enemyPath/enemySpawnLocation
	enemySpawnLocation.progress_ratio = randf()
	spawner_component.scene = enemyScene
	var rotation = enemySpawnLocation.position.angle_to_point(playerPosition)
	spawner_component.spawnWithRotation(rotation, enemySpawnLocation.position)
	
func stop():
	spawn_timer.stop()