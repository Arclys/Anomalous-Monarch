extends State


func _begin_update() -> void:
	player.sprite.play("Death")
	player.velocity = Vector2.ZERO
	animation_ended(self._on_animation_death)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	pass
func _physics_update(delta: float) -> void:
	player.apply_gravity(delta)
	player.move_and_slide()
func _end_update() -> void:
	Master.player_hp = Master.player_max_hp
	
func _on_animation_death():
	if player.sprite.animation == "Death":
		state_machine.state_changer("idle")
		get_tree().reload_current_scene()
