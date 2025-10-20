class_name State extends Node

@onready var player: Player = get_parent().get_parent()
var state_machine: StateMachine
# Inicio do Loop
func _begin_update() -> void: 
	pass
	
# Loop básico
func _update(delta: float) -> void:
	pass
	
# Loop da física	
func _physics_update(delta: float) -> void:
	pass