extends CharacterBody2D


var SPEED = -60.0
@onready var game_maneger = %GameManeger
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facing_right = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
	
	velocity.x = SPEED
	move_and_slide()
	
func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		SPEED = abs(SPEED)
	else:
		SPEED = abs(SPEED) * -1
		

func _on_area_2d_body_entered(body):
	var name = body.name
	if(name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		print(y_delta)
		if(y_delta > 50):
			print("enemy dead")
			queue_free()
			body.jump()
		else:
			print("lost heart")
			game_maneger.decrease_health()
			if (x_delta > 0):
				body.jump_side(500)
			else :
				body.jump_side(-500)

