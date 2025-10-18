class_name Player extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $Sprite

var direction = Input.get_axis("ui_left", "ui_right")
var jump = Input.is_action_just_pressed("ui_accept")

func horizon_move(speed: float, acelleration: float, delta: float) -> void:
	velocity = lerp(speed, velocity * direction, acelleration * delta)
