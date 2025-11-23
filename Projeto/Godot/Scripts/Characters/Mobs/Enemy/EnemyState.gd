extends State
class_name EnemyState


# Funções para troca de estado
func on_ground() -> bool:
	return character.is_on_floor()

func death() -> bool:
	return character.hp <= 0

func flip_sprite_x() -> void:
	if character.velocity.x != 0:
		character.sprite.scale.x = sign(character.velocity.x)

func flip_sprite_y() -> void:
	if character.velocity.y != 0:
		character.sprite.scale.y = sign(character.velocity.y)

func take_damage(amount: int) -> void:
	character.hp = clamp(character.hp - amount, 0, character.max_hp)

func animation_ended(function: Callable) -> void:
	character.sprite.connect("animation_finished", function)

func going_up() -> bool:
	return character.velocity.y < 0

func falling() -> bool:
	return character.velocity.y > 0

func walking() -> bool:
	return character.direction != 0

func stopped() -> bool:
	return on_ground() && character.direction == 0

func player_in_vision() -> bool:
	var player = get_tree().get_root().get_node("Main/Player")
	var distance_to_player = character.global_position.distance_to(player.global_position)
	var vision_range = 200.0  # Defina o alcance de visão do inimigo
	return distance_to_player <= vision_range

func enemy_collided() -> bool:
	var enemies = character.hit_box.get_overlapping_bodies()
	for body in enemies:
		if body.is_in_group("PlayerAttacks"):
			return true
	return false