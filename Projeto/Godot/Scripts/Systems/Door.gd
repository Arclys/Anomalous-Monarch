extends Area2D

@export var to_room: String
@export var player_coords: Vector2 = Vector2.ZERO
@export var player_jump_on_enter: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("PlayerBody"):
		RoomManager.activate = true
		Master.player_coords = player_coords
		RoomManager.player_jump_on_enter = player_jump_on_enter
		get_tree().call_deferred("change_scene_to_file", to_room)
		
