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
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Sfx.menumode:
		offset.y = 16*(Sfx.cursori);
		
		match Sfx.cursori:
			0:
				pass
			
			1:
				pass

func _input(event):
	if event.is_action_pressed("ui_accept") && get_parent().visible == true:
		if Sfx.menumode:
			file_select = Sfx.cursori;
			match file_select:
				0:
					LevelManager.goto_scene(LevelManager.get_scene_path())
				
				1:
					LevelManager.goto_scene("res://menus/MainMenu.tscn")
				
		
		
