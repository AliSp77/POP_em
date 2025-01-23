class_name StateMachine extends Node

@export var initial_state: State = null
var current_state: State
var States: Array[State]

func init(player: CharacterBody2D):
	for child in get_children():
		if child is State:
			child.player = player
			child.ChangeState.connect(change_state)
			States.append(child)
			
	if initial_state:
		current_state = initial_state
	else: 
		current_state = States[0]
	current_state.enter()
	
func _unhandled_input(event: InputEvent) -> void:
	current_state.handle_input(event)


func _process(delta: float) -> void:
	current_state.update(delta)


func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)


func change_state(new_state: State) -> void:
	print(current_state, " current")
	print(new_state, " new")
	if current_state == new_state:
		return
	current_state.exit()
	current_state = new_state
	current_state.enter()
