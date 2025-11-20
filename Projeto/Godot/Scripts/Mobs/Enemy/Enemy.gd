extends CharacterBody2D
class_name Enemy

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var state_machine: EnemyStateMachine = $StateMachine
@onready var hit_box: Area2D = $HitBox

var speed: float = 10.0
var jump_force: float = 20.0
var gravity: float = 500.0  # valor da gravidade
var max_hp: int = 2
var knockback_force: Vector2 = Vector2(100,-100)
var knockback_duration: float = 2.0
var knockback_direction: int = 0
var hp: int = max_hp
var direction: float = 1.0
var jump: bool = false
var attack: bool = false

func _ready() -> void:
	add_to_group("Enemies")

func _process(delta: float) -> void:
	knockback_direction = sprite.scale.x
	
func move(target_speed: float, acceleration: float, delta: float) -> Vector2:
	var target_velocity = Vector2(direction * target_speed, velocity.y)
	return velocity.lerp(target_velocity, acceleration * delta)

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
