extends TextureProgressBar

@onready var player: Player = get_parent().get_parent().get_parent().get_parent()

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	max_value = Master.player_max_hp
	min_value = 0
	value = Master.player_hp
