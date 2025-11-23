extends RigidBody2D


@export var damage: int = 1
@export var speed: float = 60.0
@export var acceleration: float = 0.1
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	add_to_group("Enemies")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.x = speed * (acceleration+delta) * sign(scale.x)
	move_and_collide(velocity * delta)

# func move(target_speed: float, acceleration: float, delta: float) -> Vector2:
# 	var target_velocity = Vector2(move_dir * target_speed, velocity.y)
# 	return velocity.lerp(target_velocity, acceleration * delta)