extends Node2D

@onready var flash_component = $FlashComponent
@onready var shake_component = $ShakeComponent
@onready var scale_component = $ScaleComponent

@export var direction = Vector2(0, 0)
var speed = 300

func _on_hurtbox_component_hurt(hitbox):
	flash_component.flash()
	shake_component.tween_shake()
	scale_component.tween_scale()

func _on_hitbox_component_hit_hurtbox(hurtbox):
	queue_free()


func _on_stats_component_no_health():
	queue_free()
