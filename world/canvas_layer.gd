extends CanvasLayer


var Gum_dialogues = [
"You can't escape me—I stick around!",
"The more you fight, the deeper I settle!",
"Your shine is no match for my grime!",
"Decay is inevitable... and I love inevitability!",
"Once I’m in, I never let go!",
"Plaque is just the beginning of your misery!",
"Floss all you want... I'll always find a way back!",
"Sweet? Sticky? Deadly? I'm the total package!",
"Mouthwash? Ha! A mere tickle to my corruption!",
"I'm the cavity you never saw coming!"
]
var Teeth_dialouges = [
"We bite back, Gum!",
"No plaque, no slack!",
"Floss, brush, repeat—your worst nightmare!",
"You’re nothing but a chewy mistake!",
"Your stickiness is no match for our strength!",
"Fresh breath will wipe you out for good!",
"Cavities fear us, and so should you!",
"We’ll scrape you off the surface of existence!",
"There’s no room for rot in this mouth!",
"Time to clean up this sticky situation!"
]

var random_dialouge_int = 0
var gum_or_Teeth_dialouge_order = false

#func _ready():
	##dialogue_panel.visible = false  # Hide dialogue panel initially
	#hide_dialogue()  # Hide dialogue box initially
#
#func show_dialogue():
	#$Panel.show()
	#update_text()
#
#func hide_dialogue():
	#$Panel.hide()
#
#func update_text():
	#random_dialouge_int = randi_range(0 , Gum_dialogues.size())
	#$Panel/RichTextLabel.text = Gum_dialogues[random_dialouge_int]
#
#func _on_Button_pressed():
	#update_text()

@onready var dialogue_panel = $messageBox
@onready var dialogue_label = $messageBox/Label

# List of Persian dialogues

# Font resource (assign your custom font in the inspector or via script)
@export var custom_font: Font

func _ready():
	dialogue_panel.hide()
	if custom_font:
		dialogue_label.add_theme_font_override("font", custom_font)
	_start_dialogue_loop()

func _start_dialogue_loop():
	show_random_dialogue()

func show_random_dialogue():
	dialogue_panel.show()
	var random_dialouge;
	if !gum_or_Teeth_dialouge_order:
		random_dialouge = "Gubble: " +  Gum_dialogues.pick_random()
	else:
		random_dialouge = "Teeth: " + Teeth_dialouges.pick_random()
		
	dialogue_label.text =random_dialouge
	
	dialogue_panel.visible = true  # Show panel
	await get_tree().create_timer(3).timeout  # Wait for 5 seconds

	dialogue_panel.visible = false  # Hide panel
	await get_tree().create_timer(2).timeout  # Wait for 7 seconds
	dialogue_panel.hide()
	gum_or_Teeth_dialouge_order = !gum_or_Teeth_dialouge_order
	show_random_dialogue()  # Repeat the process
