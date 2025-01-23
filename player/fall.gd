extends State
class_name FallState

var last_y: float 

@onready var collision: CollisionShape2D = $"../../CollisionShape2D"

@export var walk: State
@export var idle: State

func enter():
	last_y = player.position.y
	collision.disabled = true

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	if player.position.y >= (last_y + 32.0):
		collision.disabled = false
		last_y = 0
		ChangeState.emit(walk)
			
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
	
