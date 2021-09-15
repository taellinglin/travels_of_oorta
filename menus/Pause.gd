extends Control


func _ready() -> void:
	$Background/VBoxContainer/Resume.connect('pressed', self, '_on_Resume_pressed')
	$Background/VBoxContainer/Quit.connect('pressed', self, '_on_Quit_pressed')
	set_process_input(true)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('pause') and !get_parent().get_node("GameOver").game_over:

		visible = !get_tree().paused
		get_parent().get_parent().get_node("World/Player/HUD/PlayerLifeBar").visible = get_tree().paused
		get_node('Background/VBoxContainer/Resume').grab_focus()
		if get_tree().paused:
			get_tree().paused = false
		else:
			get_tree().paused = true
		
		

			
func _on_Resume_pressed() -> void:
	get_tree().paused = false
	get_parent().get_parent().get_node("World/Player/HUD/PlayerLifeBar").visible = true
	visible = false


func _on_Quit_pressed() -> void:
	LevelManager.goto_scene("res://menus/MainMenu.tscn")
	get_tree().paused = false
	visible = false

func show_hud():
	get_parent().get_parent().get_node("World/Player/HUD/PlayerLifeBar").visible = true

func hide_hud():
	get_parent().get_parent().get_node("World/Player/HUD/PlayerLifeBar").visible = false
