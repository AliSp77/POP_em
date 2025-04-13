extends State

var Jump_speed = -330
var last_y: float 

@onready var animation: AnimationPlayer = $"../../Animation"

func enter():
	animation.play("jump")
	parent.velocity.y = Jump_speed

## Called by the state machine on the engine's physics update tick.
func process_physics(_delta: float) -> void:
	if parent.velocity.y <= 0:
		ChangeState.emit(States["Fall"])
	
	if not parent.is_on_floor():
		parent.velocity += parent.get_gravity() * _delta
	
