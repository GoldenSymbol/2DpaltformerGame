class_name hitbox
extends Area2D

var damege := 10
func _init() -> void:
	collision_layer = 2
	collision_mask = 0
