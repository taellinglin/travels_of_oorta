extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var file_select = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
 # Replace with function body.
	set_process(true);
	set_process_input(true);
	Sfx.cursori = 0;
	Sfx.maxitems = 3;
	Sfx.menumode = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset.y = 21*(Sfx.cursori);

func _input(event):
	if event.is_action_pressed("ui_accept"):
		file_select = Sfx.cursori;
		print("File Select: ", file_select as String)
		match file_select:
			0:
				LevelManager.goto_scene("res://interfaces/dialogue/FileBoxes.tscn")
			
			1:
				LevelManager.goto_scene("res://menus/Soundtrack.tscn")
				#get_tree().change_scene("res://interfaces/menu/Credits.tscn")
			
			2:
				LevelManager.goto_scene("res://menus/Credits.tscn")
				
				#get_tree().change_scene("res://scenes/Title.tscn")
			3:
				LevelManager.goto_scene("res://menus/Title.tscn")
				
	if event.is_action_pressed("ui_cancel"):
		Sfx.menumode = false
		LevelManager.goto_scene("res://menus/Title.tscn")
		
