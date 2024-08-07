extends Node2D

func _process(delta):
	rotation = rotation + .02

func _on_timer_timeout():
	queue_free()
