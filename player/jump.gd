extends State

var Jump_speed = -330
var last_y: float 

@onready var collision: CollisionShape2D = $"../../CollisionShape2D"

@export var walk: State
@export var idle: State

@onready var animation: AnimationPlayer = $"../../Animation"


func enter():
	animation.play("jump")
	player.velocity.y = Jump_speed
	last_y = player.position.y
	collision.disabled = true

## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	if player.position.y <= (last_y - 55):
		collision.disabled = false
		last_y = 0
		ChangeState.emit(walk)
	
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
	
