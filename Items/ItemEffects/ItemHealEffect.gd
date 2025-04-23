extends ItemEffect
class_name ItemHealEffect

@export var heal_amount: int = 1
@export var audio: AudioStream

func use()-> void:
	##Effect item on player
	print("heal")
	#PlayerManager.PLAYER.update_hp( heal_amount )
	PausedMenu2.play_audio(audio)
