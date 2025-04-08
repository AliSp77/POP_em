extends State
class_name FallState

var last_y: float 

@onready var animation: AnimationPlayer = $"../../Animation"

func enter():
	animation.play("jump")
	print("falling")

## Called by the state machine on the engine's physics update tick.
func process_physics(_delta: float) -> void:
	print(parent.is_on_floor())
	if not parent.is_on_floor():
		parent.velocity += parent.get_gravity() * _delta
	else:
		ChangeState.emit(States["Idle"])
