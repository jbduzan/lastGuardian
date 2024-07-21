extends Node2D

@export var direction = Vector2(0, 0)
var speed = 300

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	queue_free()

func _on_hitbox_component_hit_hurtbox(hurtbox):
	queue_free()
