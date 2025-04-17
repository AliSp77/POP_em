extends Node
class_name StateMachine

@export
var starting_state: State

var current_state: State

# Initialize the state machine by giving each child state a reference to the
# parent object it belongs to and enter the default starting_state.
func init(parent: CharacterBody2D) -> void:
	for child in get_children():
		child.parent = parent
		child._ChangeState.connect(change_state)
		child.States[child.name] = child
		
	# Initialize to the default state
	if starting_state:
		current_state = starting_state
	else:
		starting_state = get_child(0)
	
	starting_state.enter()

# Change to the new state by first calling any exit logic on the current state.
func change_state(new_state: State) -> void:
	#print("from: ",current_state.name, ", to: ", new_state.name)
	if current_state == new_state:
		return
	current_state.exit()
	current_state = new_state
	current_state.enter()
	
# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	current_state.process_physics(delta)

func process_input(event: InputEvent) -> void:
	current_state.process_input(event)
	
func process_frame(delta: float) -> void:
	current_state.process_frame(delta)
