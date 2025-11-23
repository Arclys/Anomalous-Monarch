extends Node
class_name StateMachine

@export var begin_state: Node # "@export" Deixa primeiro estado visivel no inspetor
var actual_state: Node
var states_list: Dictionary[String, Node] = {} # Lista de estados


func _ready() -> void:
	for i in get_children(): # Essa parte coloca todos os states criados dentro da lista de states
		if i is Node:
			i.state_machine = self
			states_list[i.name.to_lower()] = i
	if begin_state: # Define o estado inicial como o atual (só pra não dar erro caso alguém esqueça)
		begin_state._begin_update()
		actual_state = begin_state
			
func _process(delta: float) -> void: # Atualiza gráficos
	if actual_state:
		actual_state._update(delta)

func _physics_process(delta: float) -> void: # Atualiza física
	if actual_state:
		actual_state._physics_update(delta)

# Troca de estados		
func state_changer(new_state_name: String) -> void:
	var new_state: Node = states_list.get(new_state_name.to_lower()) #PEga o nome ddo novo estado, coloca em minúsculo e procura na lista de estados
	
	# Tira isso dos comentários caso você queira verificar se um estado não está sendo encontrado
	# assert(new_state, "O estado a seguir não foi encontrado: " + new_state_name)
	if new_state:

		if actual_state: # Interrompe state atual
			actual_state._end_update()
		
		new_state._begin_update() # inicializa o state novo
		actual_state = new_state # muda o valor da variável
	else:
		push_warning("O estado a seguir não foi encontrado: " + new_state_name)
