extends Node
class_name EnemyState

@onready var enemy: Enemy = get_parent().get_parent()
var state_machine: EnemyStateMachine

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
	return enemy.is_on_floor()

func death() -> bool:
	return enemy.hp <= 0

func flip_sprite_x() -> void:
	if enemy.velocity.x != 0:
		enemy.sprite.scale.x = sign(enemy.velocity.x)

func flip_sprite_y() -> void:
	if enemy.velocity.y != 0:
		enemy.sprite.scale.y = sign(enemy.velocity.y)

func take_damage(amount: int) -> void:
	enemy.hp = clamp(enemy.hp - amount, 0, enemy.max_hp)

func animation_ended(function: Callable) -> void:
	enemy.sprite.connect("animation_finished", function)

func going_up() -> bool:
	return enemy.velocity.y < 0

func falling() -> bool:
	return enemy.velocity.y > 0

func walking() -> bool:
	return enemy.direction != 0

func stopped() -> bool:
	return on_ground() && enemy.direction == 0

func player_in_vision() -> bool:
	var player = get_tree().get_root().get_node("Main/Player")
	var distance_to_player = enemy.global_position.distance_to(player.global_position)
	var vision_range = 200.0  # Defina o alcance de visão do inimigo
	return distance_to_player <= vision_range