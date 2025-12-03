extends BossState

var attacks_maked: int = 0

func _begin_update() -> void:
	attacks_maked = 0
	if character.sprite: 
		character.sprite.play("Attack")
		if character.attack_delay_timer: 
			character.attack_delay_timer.start()

func _update(delta: float) -> void:
	pass

func _physics_update(delta: float) -> void:
	if player_attacks_collided(): take_damage(1)
	character.global_position = Vector2(Master.player_coords.x, Master.player_coords.y-80)

func _end_update() -> void:
	character.rest_timer.start()


func _on_attack_delay_timeout() -> void:
	if attacks_maked < randi_range(3,4):
		character.instance_magic()
		character.attack_delay_timer.start()
		attacks_maked += 1
	else:
		state_machine.state_changer("rest")
