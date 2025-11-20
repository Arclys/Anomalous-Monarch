extends Node
class_name State 

@onready var character: Player = get_parent().get_parent()
var state_machine: StateMachine

# Inicio do Estado
func _begin_update() -> void: 
	pass
	
# Loop básico
func _update(delta: float) -> void:
	pass
	
# Loop da física	
func _physics_update(delta: float) -> void:
	pass

# Fim do Estado
func _end_update() -> void:
	pass

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
	Master.hp = clamp(Master.hp - amount, 0, Master.max.hp)
	Master.hp_changed.emit(Master.hp, Master.max_hp)

func attack() -> bool:
	return character.attack

func death() -> bool:
	return Master.player_hp <= 0

func animation_ended(function: Callable) -> void:
	character.sprite.connect("animation_finished", function)	

func enemy_collided() -> bool:
	var enemies = character.hit_box.get_overlapping_bodies()
	for body in enemies:
		if body.is_in_group("Enemies"):
			return true
	return false

func iframes_execute():
	character.sprite.modulate.a = 0.5 + 0.5 * sin(Time.get_ticks_msec()*2 / 100.0)
