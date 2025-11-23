extends EnemyState


func _begin_update() -> void:
	enemy.sprite.play("Hit")


func _update(delta: float) -> void:	
	if enemy.sprite.animation_finished: 
		state_machine.state_changer("idle")

func _physics_update(delta: float) -> void:
	pass

func _end_update() -> void:
	pass