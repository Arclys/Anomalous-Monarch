extends Node

@export var player_hp: int = 1
@export var player_state: int = 0
var player_on_floor: bool = false
var player_hitable: bool = true

const ROOMS: Dictionary[Array,Array] = {
	[]:[]
} 

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
