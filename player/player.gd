extends CharacterBody2D
@onready var state_machine: StateMachine = $StateMachine



func _ready() -> void:
	state_machine.init(self)
	
func _physics_process(delta: float) -> void:
	if position.x <= 10 :
		position.x = 10
	if position.x >= 310:
		position.x = 310
	move_and_slide()
	
