extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $Sprite

@export var speed: float = 80.0
@export var jump_force: float = 250.0
@export var gravity: float = 500.0  # valor da gravidade

var direction: float = 0.0
var jump: bool = false

func _physics_process(delta: float) -> void:
	# Captura de inputs
	direction = Input.get_axis("m_left", "m_right")
	jump = Input.is_action_just_pressed("m_up")
	
func move(target_speed: float, acceleration: float, delta: float) -> Vector2:
	var target_velocity = Vector2(direction * target_speed, velocity.y)
	return velocity.lerp(target_velocity, acceleration * delta)

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
