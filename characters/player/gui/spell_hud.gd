extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spell_index;
const max_spells = 5;
var spell_names = {
	0: "soak", 
	1:"quake",
	2: "frost", 
	3: "gust", 
	4: "cloak", 
	5:"flash"};

 

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(false);
	set_process(true);
	spell_index = 0;
	self.get_node("spell_name").text = str(spell_names[spell_index]);
	self.frame = spell_index;
	
func _input(event):
	print_debug(spell_index);
	print_debug(event);
	if(event.is_action("r-trigger") && event.is_action_pressed("ui_up")):
		if spell_index < max_spells:
			spell_index += 1;
			print("Spell: ("+str(spell_index)+"/"+str(max_spells)+")");
			#self.position(spell_index);
			self.get_node("spell_name").text = str(spell_names[spell_index]);
			self.frame = spell_index;

			
	if(event.is_action("r-trigger") && event.is_action_pressed("ui_down")):
		if (spell_index > 0):
			spell_index -= 1;
			print("Spell: ("+str(spell_index)+"/"+str(max_spells)+")");
			self.get_node("spell_name").text = str(spell_names[spell_index]);
			self.frame = spell_index;
		
func _process(delta):
	if(Input.is_action_pressed("r-trigger") && Input.is_action_just_pressed("move_up")):
		if spell_index < max_spells:
			spell_index += 1;
			Sfx.sfx_cursor();
		#print("Spell: (", spell_index+"/", max_spells+")");
			#self.position(spell_index);
			self.frame = spell_index;
		else:
			Sfx.sfx_disabled();
	if(Input.is_action_pressed("r-trigger") && Input.is_action_just_pressed("move_down")):
		if (spell_index > 0):
			Sfx.sfx_cursor();
			spell_index -= 1;
			#print("Spell: (",spell_index,"/"+max_spells+")");
			self.frame = spell_index;
		else:
			Sfx.sfx_disabled();
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
