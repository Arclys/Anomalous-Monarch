extends State
class_name PlayerState 


# Funções para troca de estado

func on_ground() -> bool:
	return character.is_on_floor()
				
func jumping() -> bool:
	return on_ground() && character.jump

func walking() -> bool:
	return character.move_dir != 0

func stopped() -> bool:
	return on_ground() && character.move_dir == 0
	
func falling() -> bool:
	return character.velocity.y > 0

func going_up() -> bool:
	return character.velocity.y < 0

func flip_sprite() -> void:
	if character.velocity.x != 0:
		character.sprite.scale.x = sign(character.velocity.x)

func take_damage(amount: int) -> void:
	Master.player_hp = clamp(Master.player_hp - amount, 0, Master.player_max_hp)
	# Master.hp_changed.emit(Master.player_hp, Master.player_max_hp)

func attack() -> bool:
	return character.attack

func death() -> bool:
	return Master.player_hp <= 0

func animation_ended(function: Callable) -> void:
	character.sprite.connect("animation_finished", function)	

func enemy_collided() -> bool:
	var enemies = character.hurt_box.get_overlapping_bodies()
	for body in enemies:
		if body.is_in_group("Enemies"):
			return true
	return false

func iframes_execute() -> void:
	character.sprite.modulate.a = 0.5 + 0.5 * sin(Time.get_ticks_msec()*2 / 100.0)

func jump() -> void:
	character.velocity.y = -character.jump_force

func transition_room() -> bool:
	return RoomManager.activate

func off_cam_smoothing() -> void:
	if character.camera:
		character.camera.position_smoothing_enabled = false

func on_cam_smoothing() -> void:
	if character.camera:
		character.camera.position_smoothing_enabled = true
