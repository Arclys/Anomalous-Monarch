extends RigidBody2D


@onready var sprite: AnimatedSprite2D = $Sprite
var player_pos: Vector2
var move_direction: float = -1
var damage: int = 1
var speed: float = 40.0
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	scale.x = move_direction
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.y = speed * sign(move_direction)
	move_and_collide(velocity * delta)

# func move(target_speed: float, acceleration: float, delta: float) -> Vector2:
# 	var target_velocity = Vector2(move_dir * target_speed, velocity.y)
# 	return velocity.lerp(target_velocity, acceleration * delta)
