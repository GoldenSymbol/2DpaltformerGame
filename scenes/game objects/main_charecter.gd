extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var is_attacking = false;

func jump():
	velocity.y = JUMP_VELOCITY

func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta):
	#Animations
	if not(sprite_2d.animation == "attacking" and sprite_2d.is_playing()):
		if (velocity.x != 0) && velocity.y == 0:
			sprite_2d.play("running")
		elif (velocity.y == 0):
			sprite_2d.play("idle")
	
		
	
	if Input.is_action_just_pressed("attack"):
		sprite_2d.animation = "attacking"

	
	# Add the gravity.
	if is_on_floor():
		jump_count = 0
	else:
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"
	# going down 
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)
	
	
	move_and_slide()
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft



