extends State
class_name TransitionState

var last_y: float 

@onready var animation: AnimationPlayer = $"../../Animation"

func enter():
	last_y = parent.position.y
	animation.play("jump")
	parent.set_collision_mask_value(3, false)
	get_tree().create_timer(0.2).timeout.connect(change)

## Called by the state machine on the engine's physics update tick.
func process_physics(_delta: float) -> void:
	if parent.position.y >= (last_y + 32.0):
		parent.set_collision_mask_value(3, true)
		ChangeState.emit(States["Fall"])
		
	if not parent.is_on_floor():
		parent.velocity += parent.get_gravity() * _delta

func change():
	parent.set_collision_mask_value(3, true)
	ChangeState.emit(States["Fall"])
