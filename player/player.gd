class_name player
extends CharacterBody2D

@onready var state_machine: Node = $StateMachine

var Health = 3

func _ready() -> void:
	state_machine.init(self)
	
func _physics_process(delta: float) -> void:
	move_and_slide()
