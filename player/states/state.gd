## Virtual base class for all states.
## Extend this class and override its methods to implement a state.
class_name State extends Node

## Emitted when the state finishes and wants to transition to another state.
signal ChangeState(State)

var parent: CharacterBody2D

static var States: Dictionary

func enter() -> void:
	#player.animations.play(animation_name)
	pass
	
func exit() -> void:
	pass

func process_input(event: InputEvent) -> void:
	pass

func process_frame(delta: float) -> void:
	pass

func process_physics(delta: float) -> void:
	pass
