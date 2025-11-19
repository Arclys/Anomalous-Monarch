extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var state_machine: StateMachine = $StateMachine


# VARIAVEIS SIMPLES
@export var speed: float = 80.0
@export var jump_force: float = 250.0
@export var gravity: float = 500.0  # valor da gravidade
@export var max_hp: int = 5
@export var knockback_force: Vector2 = Vector2(100,-100)
@export var knockback_duration: float = 2.0

var knockback_direction: int = 0
var hp: int = max_hp
var direction: float = 0.0
var jump: bool = false
var attack: bool = false

var sprite_direction: int = sign(velocity.x)
var knockback_time: float = 0.0

# ALARMES?
signal hp_changed(value: int, max_value: int)

# Funções 
func _ready() -> void:
	state_machine.state_changer("idle")

func _process(delta: float) -> void:
	knockback_direction = sprite.scale.x

func _physics_process(delta: float) -> void:
	# Captura de inputs
	direction = Input.get_axis("m_left", "m_right")
	jump = Input.is_action_just_pressed("m_up")
	attack = Input.is_action_just_pressed("mb_attack")
	
func move(target_speed: float, acceleration: float, delta: float) -> Vector2:
	var target_velocity = Vector2(direction * target_speed, velocity.y)
	return velocity.lerp(target_velocity, acceleration * delta)

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
