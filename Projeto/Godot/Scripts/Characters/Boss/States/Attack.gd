extends BossState

var attacks_maked: int = 0

func _begin_update() -> void:
	attacks_maked = 0
	if character.sprite: 
		character.sprite.play("Attack")
		character.delay_attack_timer.start()

func _update(delta: float) -> void:
	pass

func _physics_update(delta: float) -> void:
	following_player(delta)
	var player_dir = sign(Master.player.global_position.x - character.global_position.x)
	
	# calcula nova velocidade
	var new_velocity = character.move(50, player_dir, delta)
	character.velocity.x = new_velocity.x
	

	character.position.y = Master.player.global_position.y + -64
	character.move_and_slide()

func _end_update() -> void:
	character.rest_timer.start()


func _on_attack_delay_timeout() -> void:
	if attacks_maked < 3:
		character.instance_magic()
		character.delay_attack_timer.start()
		attacks_maked += 1
	else:
		state_machine.state_changer("rest")
