extends State


func _begin_update() -> void:
	player.sprite.play("Fall")
 
func _update(delta: float) -> void:
	if on_ground(): state_machine.state_changer('idle')
	if jumping(): state_machine.state_changer('jump')
	flip_sprite()

func _physics_update(delta: float) -> void:
	player.velocity.x = player.move(player.speed,10.,delta).x
	player.apply_gravity(delta)
	player.move_and_slide()
	
func _end_update() -> void:
	pass
