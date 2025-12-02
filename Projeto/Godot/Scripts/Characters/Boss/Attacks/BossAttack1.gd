extends RigidBody2D


@export var damage: int = 1
@export var speed: float = 30.0
@export var acceleration: float = -2
@onready var sprite: AnimatedSprite2D = $Sprite
var velocity: Vector2 = Vector2.ZERO
@onready var player_pos: Vector2
@onready var move_direction: float = position.x - Master.player_coords.x

func _ready() -> void:
	
	scale.x = sign(move_direction)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	
	speed += acceleration
	velocity.x = speed * sign(move_direction)
	move_and_collide(velocity * delta)

# func move(target_speed: float, acceleration: float, delta: float) -> Vector2:
# 	var target_velocity = Vector2(move_dir * target_speed, velocity.y)
# 	return velocity.lerp(target_velocity, acceleration * delta)
