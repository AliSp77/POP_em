extends CharacterBody2D
@onready var state_machine: StateMachine = $StateMachine
@onready var animation: AnimationPlayer = $Animation

@onready var pistol: Node2D = $Pistol

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
