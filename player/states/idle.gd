## Virtual base class for all states.
## Extend this class and override its methods to implement a state.
class_name IdleState extends State

@onready var animation: AnimationPlayer = $"../../Animation"

## Called by the state machine on the engine's physics update tick.
func process_physics(_delta: float) -> void:
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	if direction != 0:
		_ChangeState.emit(States["Walk"])
		return 
	
	if not parent.is_on_floor():
		await get_tree().create_timer(0.2).timeout
		_ChangeState.emit(States["Fall"])
	
	if Input.is_action_just_pressed("top"):
		_ChangeState.emit(States["Jump"])
	
	if Input.is_action_just_pressed("down"):
		_ChangeState.emit(States["Transition"])
		
## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter() -> void:
	parent.velocity.x = 0
	animation.play("idle")
