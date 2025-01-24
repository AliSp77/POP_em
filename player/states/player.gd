extends CharacterBody2D
@onready var state_machine: StateMachine = $StateMachine
@onready var animation: AnimationPlayer = $Animation
@onready var invulner: Timer = $invulner

@onready var pistol: Node2D = $Pistol

var inv: bool = true

func _ready() -> void:
	state_machine.init(self)
	pistol.projectile_color = Color(1, 0.5019, 0.6431)
	pistol.power_select = pistol.Normal
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("power1"):
		pistol.projectile_color = Color(1, 0.5019, 0.6431)
		pistol.power_select = pistol.Normal
	if Input.is_action_just_pressed("power2"):
		pistol.projectile_color = Color(0.6431, 0, 0)
		pistol.power_select = pistol.Cinemenn
	if Input.is_action_just_pressed("power3"):
		pistol.projectile_color = Color(0, 0.4549, 0.0705)
		pistol.power_select = pistol.Mint
		
		
	if position.x <= 10 :
		position.x = 10
	if position.x >= 310:
		position.x = 310
	move_and_slide()

func _on_hurt_box_damage_taken(damage: int) -> void:
	animation.play("ouch")
	invulner.start()
	inv = true
#
		#inv = true
		#invulner.start()
#
#func _on_invulner_timeout() -> void:
	#inv = false

func _on_hurt_box_health_depleted() -> void:
	print("you died")

func _on_invulner_timeout() -> void:
	inv = false
