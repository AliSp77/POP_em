## Virtual base class for all states.
## Extend this class and override its methods to implement a state.
class_name WalkState extends State

var direction : int = 1
var current_direcion: int = 1
var move_speed = 200
@onready var sprite: Sprite2D = $"../../Sprite2D"

@export var idle: State

## Called by the state machine when receiving unhandled input events.
func handle_input(_event: InputEvent) -> void:
	pass
	
## Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> void:
	pass

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	print(direction)

	if direction == 0:
		print(direction)
		ChangeState.emit(idle)
		return
		
	if current_direcion != direction:
		
		print(direction, " dir")
		if direction == 1:
			HandleRotate(0)
		else:
			HandleRotate(1)
		# Add the gravity.
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
	
	player.velocity.x = move_speed * direction
## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter() -> void:
	print("walk")

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass

func HandleRotate(flipped: int):
	sprite.flip_h = flipped
