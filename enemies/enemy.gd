extends Node2D

@export var direction = Vector2(0, 0)
var speed = 300

func _on_hurtbox_component_hurt(hitbox):
	queue_free()

func _on_hitbox_component_hit_hurtbox(hurtbox):
	queue_free()


func _on_stats_component_no_health():
	queue_free()
