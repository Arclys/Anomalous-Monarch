class_name State extends Node

@onready var player: Player = get_parent().get_parent()
var state_machine: StateMachine

# Inicio do Estado
func _begin_update() -> void: 
	pass
	
# Loop básico
func _update(delta: float) -> void:
	pass
	
# Loop da física	
func _physics_update(delta: float) -> void:
	pass

# Fim do Estado
func _end_update() -> void:
	pass

# Funções para troca de estado

func on_ground() -> bool:
	return player.is_on_floor()
				

func jumping() -> bool:
	return on_ground() && player.jump

func walking() -> bool:
	return player.direction != 0

func stopped() -> bool:
	return on_ground() && player.direction == 0
	
func falling() -> bool:
	return player.velocity.y > 0

func going_up() -> bool:
	return player.velocity.y < 0

func flip_sprite() -> void:
	if player.velocity.x != 0:
		player.sprite.scale.x = sign(player.velocity.x)

func take_damage(amount: int) -> void:
	var hp: int = player.actual_hp
	var hp_max: int = player.max_hp
	hp = clamp(hp - amount, 0, hp_max)
	player.hp_changed.emit(player.actual_hp, player.max_hp)
