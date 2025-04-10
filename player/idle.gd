## Virtual base class for all states.
## Extend this class and override its methods to implement a state.
class_name IdleState extends State

var direction : int = 1
var current_direcion: int = 1
@onready var sprite: Sprite2D = $"../../Sprite2D"

@export var walk: State
@export var jump: State
@export var fall: State

@onready var animation: AnimationPlayer = $"../../Animation"

## Called by the state machine when receiving unhandled input events.
func handle_input(_event: InputEvent) -> void:
	pass

## Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> void:
	pass

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	if direction != 0:
		ChangeState.emit(walk)

		# Add the gravity.
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
	
	if Input.is_action_just_pressed("top") and player.is_on_floor() and player.position.y >= 39:
		ChangeState.emit(jump)
	
	if Input.is_action_just_pressed("down") and player.is_on_floor() and player.position.y <= 134:
		ChangeState.emit(fall)
		
## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter() -> void:
	player.velocity.x = 0
	animation.play("idle")
	print("idle")

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass
