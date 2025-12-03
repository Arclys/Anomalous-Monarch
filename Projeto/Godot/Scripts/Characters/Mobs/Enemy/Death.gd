extends EnemyState


func _begin_update() -> void:
	character.sprite.play("Hit")


func _update(delta: float) -> void:	
	if character.sprite.animation_finished: 
		character.queue_free()

func _physics_update(delta: float) -> void:
	pass

func _end_update() -> void:
	pass