extends Node


@export var global_time: float = 0.0
@export var player_max_hp: float = 5
@export var player_hp: float = player_max_hp
@export var player_money: int = 0
@onready var player_coords: Vector2
@onready var audios_node = self.get_node("Audios") as Node

var player: Player
var player_hitabble: bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		player_coords = player.position
	global_time += delta

func play_audio(audio: NodePath, min_pitch: float = .85, max_pitch: float = 1):		
	var node = audios_node.get_node_or_null(audio) as AudioStreamPlayer
	node.pitch_scale = randf_range(min_pitch, max_pitch)
	node.play()
