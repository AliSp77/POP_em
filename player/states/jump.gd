extends State

var Jump_speed = -330
var initial_pos: Vector2 
@export var jump_limit = 100
@onready var animation: AnimationPlayer = $"../../Animation"


func enter():
	animation.play("jump")
	parent.velocity.y = parent.player_resource.jump_speed
	initial_pos = parent.position
	
## Called by the state machine on the engine's physics update tick.
func process_physics(_delta: float) -> void:
	if abs(parent.position.y - initial_pos.y) >= jump_limit:
		_ChangeState.emit(States["Fall"])
	
	if parent.velocity.y >= 0:
		
		_ChangeState.emit(States["Fall"])
	if not parent.is_on_floor():
		parent.velocity += parent.get_gravity() * _delta
	
func exit():
	parent.velocity.y = 0
	pass
