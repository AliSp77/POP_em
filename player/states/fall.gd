extends State
class_name FallState

var last_y: float 

@onready var animation: AnimationPlayer = $"../../Animation"

func enter():
	animation.play("jump")

## Called by the state machine on the engine's physics update tick.
func process_physics(_delta: float) -> void:
	if not parent.is_on_floor():
		parent.velocity.y = -parent.player_resource.jump_speed
	else:
		_ChangeState.emit(States["Idle"])
