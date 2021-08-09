extends Node2D
class_name FileBoxes

signal interaction(type)

export(String) var scene_path = '' setget set_scene_path

var host = null
var menu = ["file1","file2", 'file3']


func _ready() -> void:
	$PanelContainer1.connect('pressed', self, '_on_File1_button_pressed')
	$PanelContainer2.connect('pressed', self, '_on_File2_button_pressed')
	$PanelContainer3.connect('pressed', self, '_on_File2_button_pressed')
	menu = ["file1", "file2", "file3"];
	Sfx.menumode = true;
	Sfx.maxitems = 2;
	

func start(body) -> void:
	host = body
	self.connect('interaction', host, '_change_state')
	$Panel/Vertical/Yes.grab_focus()
	$Tween.interpolate_property(self, 'modulate', Color(0, 0, 0, 0), Color(1, 1, 1, 1), 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()


func set_scene_path(new_scene_path: String) -> void:
	scene_path = new_scene_path


func _on_File1_button_pressed() -> void:
	#Load File
	LevelManager.goto_scene('res://scenes/Level0.tscn' % [scene_path])
	
func _on_File2_button_pressed() -> void:
	#Load File
	LevelManager.goto_scene('res://scenes/Level1.tscn' % [scene_path])

func _on_File3_button_pressed() -> void:
	#Load File
	LevelManager.goto_scene('res://scenes/Level2.tscn' % [scene_path])


