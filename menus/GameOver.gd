"""
Game over interface with some simples fade in animation.
- Retry should restart the current level
- Quit should quit the application
"""
extends Control


func _ready() -> void:
	$GameOverAlert/retry.connect('pressed', self, '_on_Retry')
	$GameOverAlert/mainmenu.connect('pressed', self, '_on_Quit')
	Sfx.maxitems = 2;
	
	


func show() -> void:
	$AnimationPlayer.play('Show')
	Sfx.menumode = true;
	Sfx.maxitems = 2;
	

func _on_Retry() -> void:
	get_node("AudioStreamPlayer2").play()
	LevelManager.goto_scene(LevelManager.get_scene_path())


func _on_Quit() -> void:
	LevelManager.goto_scene("res://menus/MainMenu.tscn")
