extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var state_machine: StateMachine = $StateMachine
@onready var hit_box: Area2D = $Hitbox

# VARIAVEIS SIMPLES
@export var speed: float = 80.0
@export var jump_force: float = 250.0
@export var gravity: float = 500.0  # valor da gravidade
@export var max_hp: int = 5
@export var knockback_force: Vector2 = Vector2(100,-100)
@export var knockback_duration: float = 2.0

var knockback_dir: int = 0
var hp: int = max_hp
var move_dir: float = 0.0
var jump: bool = false
var attack: bool = false

var spr_dir: int = sign(velocity.x)
var knockback_time: float = 0.0

# ALARMES?
signal hp_changed(value: int, max_value: int)

# Funções 
func _ready() -> void:
	state_machine.state_changer("idle")

func _process(delta: float) -> void:
	knockback_dir = sprite.scale.x

func _physics_process(delta: float) -> void:
	# Captura de inputs
	move_dir = Input.get_axis("m_left", "m_right")
	jump = Input.is_action_just_pressed("m_up")
	attack = Input.is_action_just_pressed("mb_attack")
	
func move(target_speed: float, acceleration: float, delta: float) -> Vector2:
	var target_velocity = Vector2(move_dir * target_speed, velocity.y)
	return velocity.lerp(target_velocity, acceleration * delta)

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
