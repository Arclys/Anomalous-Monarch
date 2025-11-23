extends CharacterBody2D
class_name Boss

@export var hp: int = 20
@export var speed: float = 50.0
@export var gravity: float = 500.0
@export var attacks_damage: Dictionary[BossState, float] = {}
@export var enemies_group: String

var player: Player
var move_dir: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta

func move(target_speed: float, acceleration: float, delta: float) -> Vector2:
	var target_velocity = Vector2(move_dir * target_speed, velocity.y)
	return velocity.lerp(target_velocity, acceleration * delta)