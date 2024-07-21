extends Node

@export var enemyScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$player.setPosition($playerPosition.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#
func _on_enemy_spawn_timer_timeout():
	if $player:
		var enemy = enemyScene.instantiate()
		var enemySpawnLocation = $enemyPath/enemySpawnLocation
		enemySpawnLocation.progress_ratio = randf()
		enemy.position = enemySpawnLocation.position
		enemy.direction = enemy.position.direction_to($player.global_position)

		add_child(enemy)
	
#func _on_player_hit():
	#if (!$player):
		#$enemySpawnTimer.stop()
#


func _on_player_death():
	$enemySpawnTimer.stop()
