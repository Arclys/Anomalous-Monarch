extends EnemyState


func _begin_update() -> void:
	enemy.sprite.play("Fall")
	

func _update(delta: float) -> void:
	if death(): state_machine.state_changer("death")
	if on_ground(): state_machine.state_changer("idle")
	flip_sprite_x()
	flip_sprite_y()
	
func _physics_update(delta: float) -> void:
	enemy.velocity.x = enemy.move(enemy.speed, 10., delta).x
	enemy.apply_gravity(delta)
	enemy.move_and_slide()

func _end_update() -> void:
	enemy.sprite.scale.y = 1.
