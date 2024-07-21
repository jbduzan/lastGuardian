class_name MoveToComponent
extends Node

@export var actor: Node2D

func _physics_process(delta: float) -> void:
	actor.translate(actor.direction * actor.speed * delta)
