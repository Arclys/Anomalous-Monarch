extends State


func _begin_update() -> void:
	player.sprite.play("Fall")
 
func _update(delta: float) -> void:
	pass

func _physics_update(delta: float) -> void:
	player.velocity.x = player.move(player.speed,0.5,delta)
	player.move_and_slide()

func _end_update() -> void:
	if on_ground(): state_machine.state_changer('idle')
	if jumping(): state_machine.state_changer('jump')