extends StaticBody2D

var canon_ball = load("res://scenes/game objects/canon_ball.tscn")

@export var shooting : bool
var fire_rate = 2

@onready var animation_player = $AnimationPlayer
@onready var firepoint = $FirePoint

var max_health = 3
var health

func _ready():
	health = max_health
	shooting = true
	shoot()

func shoot():
	while shooting:
		$AnimationPlayer.play("fire")
		await get_tree().create_timer(fire_rate).timeout

func fire():
	var spawned_ball = canon_ball.instantiate()
	spawned_ball.diraction = firepoint.scale.x
	spawned_ball.global_position = firepoint.position
	add_child(spawned_ball)
