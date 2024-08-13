extends Node

@onready var sprite_2d = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	#attacking
	if Input.is_action_just_pressed("attack"):
		sprite_2d.animation = "attcking"
