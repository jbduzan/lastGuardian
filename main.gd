extends Node

@onready var player = $player
@onready var enemy_generator = $EnemyGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	$player.setPosition($playerPosition.position)
	enemy_generator.playerPosition = $playerPosition.position

func _on_player_death():
	$EnemyGenerator.stop()
