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

func player_in_vision() -> bool:
	var vision_range = 100.0  # Defina o alcance de visão do inimigo
	var distance_to_player = character.global_position.distance_to(Master.player.position)
	return distance_to_player <= vision_range


func following_player(delta) -> void:
	var player_dir = Master.player.global_position.x - character.global_position.x
   
   # calcula nova velocidade
	var new_velocity = character.move(50, sign(player_dir), delta)  # exemplo: speed=50, accel=5
	character.velocity.x = new_velocity.x
	character.global_position.y = Master.player.global_position.y - 64

func take_damage(amount: int) -> void:
	character.hp = clamp(Master.character.hp - amount, 0, Master.character.max_hp)

func player_attacks_collided() -> bool:
	var enemies = character.hurt_box.get_overlapping_bodies()
	for body in enemies:
		if body.is_in_group("PlayerAttacks"):
			print(character.hp)
			return true
	return false

func deafeated() -> bool:
	if character.hp == 0:
		return true
	return false
