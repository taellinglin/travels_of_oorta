extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var option_select = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
 # Replace with function body.
	set_process(true);
	set_process_input(true);
	Sfx.cursori = 0;
	Sfx.maxitems = 1;
	Sfx.menumode = get_parent().game_over ;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset.y = 16*(Sfx.cursori);
	Sfx.menumode = get_parent().game_over;

func _input(event):
	if get_parent().game_over:
		if event.is_action_pressed("ui_up"):
			if Sfx.cursori > 0:
				Sfx.cursori -= 1
				Sfx.sfx_cursor()
			else:
				Sfx.sfx_disabled()
		if event.is_action_pressed("ui_down"):
			if Sfx.cursori < 1:
				Sfx.cursori += 1
				Sfx.sfx_cursor()
			else:
				Sfx.sfx_disabled()
		
	
		if event.is_action_pressed("ui_accept"):
			option_select = Sfx.cursori;
			print("Game Over: ", option_select as String)
			match option_select:
				0:
					get_tree().paused = false
					get_parent().game_over =  false
					print("Going to Scene: ", LevelManager.get_scene_path())
					LevelManager.goto_scene(LevelManager.get_scene_path())


				1:
					LevelManager.goto_scene("res://menus/MainMenu.tscn")
					get_tree().paused = false
					get_parent().game_over =  false
					get_parent().visible = false
					
		if event.is_action_pressed("ui_cancel"):
			LevelManager.goto_scene("res://menus/MainMenu.tscn")
			get_tree().paused = false
			get_parent().game_over =  false
			get_parent().visible = false
		
		
