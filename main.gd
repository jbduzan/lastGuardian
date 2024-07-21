extends Node

@onready var player = $player
@onready var enemy_generator = $EnemyGenerator
@onready var progress_bar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	$player.setPosition($playerPosition.position)
	enemy_generator.playerPosition = $playerPosition.position

func _on_player_death():
	$EnemyGenerator.stop()

func _on_enemy_generator_death(xp: int):
	$player.xpGained(xp)


func _on_player_on_lvl_gained(lvl: int):
	pass

func _on_player_on_xp_gained(xp :int):
	$ProgressBar.value = xp
