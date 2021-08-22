extends Control

func _ready():
	$Button.connect('pressed', self, '_on_Pressed')
	set_process_input(true)

func _on_Pressed():
	Sfx.sfx_back()
	get_tree().change_scene('res://menus/MainMenu.tscn')

func _input(event):
	if(event.is_action_pressed("ui_accept")):
		Sfx.sfx_back()
		LevelManager.goto_scene('res://menus/MainMenu.tscn')
