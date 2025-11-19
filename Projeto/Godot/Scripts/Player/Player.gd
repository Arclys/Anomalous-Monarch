extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $Sprite

# VARIAVEIS SIMPLES
@export var speed: float = 80.0
@export var jump_force: float = 250.0
@export var gravity: float = 500.0  # valor da gravidade
@export var max_hp: int = 5
@export var knockback_force: Vector2i = Vector2i(30,50)
@export var knockback_duration: float = 2.0
var actual_hp: int = max_hp
var direction: float = 0.0
var jump: bool = false
var hitabble: bool = true
var sprite_direction: int = sign(velocity.x)
var knockback_time: float = 0.0

# ALARMES?
signal hp_changed(value: int, max_value: int)

func _physics_process(delta: float) -> void:
	# Captura de inputs
	direction = Input.get_axis("m_left", "m_right")
	jump = Input.is_action_just_pressed("m_up")
	
func move(target_speed: float, acceleration: float, delta: float) -> Vector2:
	var target_velocity = Vector2(direction * target_speed, velocity.y)
	return velocity.lerp(target_velocity, acceleration * delta)

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
