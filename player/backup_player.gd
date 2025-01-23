extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0


@onready var platform: TileMapLayer = $"../TileMap/Platform"
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"."

var last_x: float = 0.0
var jump: bool = false
var fall: bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("top") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		platform.collision_enabled = false
		jump = true
		last_x = position.y

	if position.y <= (last_x - 60) and jump:
		print(jump)
		platform.collision_enabled = true
		last_x = 0
		jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	print(direction)
	if direction == 1:
		velocity.x = direction * SPEED
		player.scale = Vector2(1,1)
	
	elif direction == -1:
		velocity.x = direction * SPEED
		player.scale = Vector2(-1,1)
	else:
		velocity.x = direction * SPEED
		#player.scale.x = 1
	move_and_slide()

	if Input.is_action_just_pressed("down") and is_on_floor():
		fall = true
		last_x = position.y
		platform.collision_enabled = false
	
	if position.y >= (last_x + 32.0) and fall:
		platform.collision_enabled = true
		last_x = 0
		fall = false


func _on_timer_timeout() -> void:
	platform.collision_enabled = true
