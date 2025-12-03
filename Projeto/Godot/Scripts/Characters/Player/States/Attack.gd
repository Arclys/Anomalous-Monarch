extends PlayerState

var hitted: bool = false

func _begin_update() -> void:
	character.hspd /= 2
	if character.velocity.x != 0:
		character.hit_box.scale.x = sign(character.sprite.scale.x)
	if character.sprite:
		character.sprite.play("Attack")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	animation_ended(_on_animation_finished)
	if transition_room(): state_machine.state_changer("roomtrade")

	

func _physics_update(delta: float) -> void:
	if !hitted:
		character.velocity.x = character.move(character.hspd,10.,delta).x
		character.apply_gravity(delta)
		character.move_and_slide()
		if jumping(): jump()

func _end_update() -> void:
	hitted = false
	character.hspd *= 2

func _on_animation_finished():
		state_machine.state_changer("idle")


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		hitted = true
		body.hp -= character.attack_damage
