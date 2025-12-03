extends State
class_name BossState

# Funções para troca de estado
func on_ground() -> bool:
	return character.is_on_floor()

func death() -> bool:
	return character.hp <= 0

func falling() -> bool:
	return character.velocity.y > 0

func going_up() -> bool:
	return character.velocity.y < 0

func flip_sprite_x() -> void:
	if character.velocity.x != 0:
		character.sprite.scale.x = sign(character.velocity.x)

func following_player(delta) -> void:
	var player_dir = Master.player.global_position.x - character.global_position.x
	character.global_position.x = character.move(player_dir, 1, delta).x
	character.global_position.y = Master.player.global_position.y + -64
