extends Node2D

var diraction
var speed = 200.0
var liftime = 2.0
var hit = false
@onready var game_maneger = %GameManeger

func _ready():
	await get_tree().create_timer(liftime).timeout
	die()

func _physics_process(delta):
	position.x += abs(speed * delta) * diraction

func die():
	hit = true
	speed = 0
	$AnimationPlayer.play("hit")

func _on_area_2d_area_entered(body):
	var name = body.name
	if(name == "CharacterBody2D") && !hit:
		print("lost heart")
		game_maneger.decrease_health()
		die()


