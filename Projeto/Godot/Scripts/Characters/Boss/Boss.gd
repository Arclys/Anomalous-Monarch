extends CharacterBody2D
class_name Boss

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var rest_timer: Timer = $Rest
@onready var attack_delay_timer: Timer = $AttackDelay
@onready var hurt_box: Area2D = $Hurtbox
@onready var BOSSMAGIC1 := preload("res://Actors/Boss/BossMagic1.tscn")

@export var max_hp: int = 30
@export var speed: float = 50.0
@export var gravity: float = 500.0

var rest_pos: Vector2
var markers: Array = []
var move_dir: float = 0.0
var hp: int = max_hp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in sprite.get_children():
		if i is Marker2D:
			markers.append(i)

	rest_pos = position

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

func instance_magic() -> void:
		for i in markers:
			var magic := BOSSMAGIC1.instantiate()
			magic.global_position = i.global_position
			get_tree().current_scene.add_child(magic)
