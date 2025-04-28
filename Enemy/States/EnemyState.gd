extends Node
class_name	EnemyState

## store a refrence 
var enemy: Enemy
var state_machine:  EnemyStateMachine

signal _ChangeState(State)

static var States: Dictionary

func init() -> void:
	pass

func enter() -> void:
	#player.animations.play(animation_name)
	pass
	
func exit() -> void:
	pass


func process_frame(delta: float) -> void:
	pass

func process_physics(delta: float) -> void:
	pass
