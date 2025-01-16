extends CharacterBody2D

const SPEED = 50.0
const JUMP_VEL = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1.0

@onready var ground_detector = $Body/GroundDetector
@onready var body = $Body

func _physics_process(delta):
	# Adds gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#Flip the goober if touching a wall or at a cliff.
	var ground_colliders = ground_detector.get_overlapping_bodies()
	print(ground_colliders)
	if len(ground_colliders) < 1 or is_on_wall():
		print("Turning around.")
		direction = -direction
		body.scale.x = direction
	
	#Set velocity.
	velocity.x = lerp(velocity.x, direction * SPEED, 0.5)

	move_and_slide()
