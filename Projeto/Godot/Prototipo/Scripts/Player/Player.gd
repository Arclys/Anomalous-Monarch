extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $Sprite
@export var speed: float = 20.
@export var jump_speed: float = 50.
@export var mass: float = 0.

var direction = Input.get_axis("m_left", "m_right")
var jump = Input.is_action_just_pressed("m_up")

func move(_speed: float, acelleration: float, delta: float) -> Vector2:
	return lerp(Vector2(speed, speed), velocity * direction, acelleration * delta)
