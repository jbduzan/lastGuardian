extends Node2D
signal hit
signal death

var smoothMousePosition: Vector2
var hp = 2

func setPosition(pos):
	position = pos
#
func shoot():
	$weapon.shoot()


func _on_stats_component_no_health():
	queue_free()
	death.emit()
