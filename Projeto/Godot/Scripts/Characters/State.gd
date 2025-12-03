extends Node
class_name State

@onready var character:= get_parent().get_parent()
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
