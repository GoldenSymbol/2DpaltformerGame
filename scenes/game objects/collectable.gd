extends Area2D

@onready var game_maneger = %GameManeger


func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		queue_free()
		game_maneger.add_points()
