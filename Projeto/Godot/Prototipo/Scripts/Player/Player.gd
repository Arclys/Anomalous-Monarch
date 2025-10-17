extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $Sprite


const SPEED = 80.0
const JUMP_VELOCITY = -230.0

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += (get_gravity() * delta) * .5

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#region
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
	
	if velocity.y > 0:
		sprite.play("Fall")
	elif velocity.y < 0:
		sprite.play("Jump")
	elif direction != 0:
		sprite.play("Walk")
	else :
		sprite.play("Idle")
	#endregion
	move_and_slide()
