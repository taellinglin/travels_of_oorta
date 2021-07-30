extends Node

var cursori = 0
var maxitems = 2;
var menumode = true
var cursor = preload("res://audio/cursor.wav") # you can use load() instead
var select =  preload("res://audio/select.wav")
var back = preload("res://audio/back.wav")
var disabled = preload("res://audio/disabled.wav")

var cursorsfx = AudioStreamPlayer.new()
var selectsfx = AudioStreamPlayer.new()
var backsfx = AudioStreamPlayer.new()
var disabledsfx = AudioStreamPlayer.new()

func _ready():
	set_process_input(true);
	cursorsfx.stream = cursor;
	selectsfx.stream = select;
	backsfx.stream = back;
	disabledsfx.stream= disabled;
	add_child(cursorsfx)
	add_child(selectsfx)	
	add_child(backsfx)
	add_child(disabledsfx)
	
func sfx_cursor():
	cursorsfx.play()
	
func sfx_select():
	selectsfx.play()
	
func sfx_back():
	backsfx.play()
	
func sfx_disabled():
	disabledsfx.play()
	
func _input(event):
	if (menumode):
		if(event.is_action_pressed("ui_up")):
			if(cursori > 0):
				sfx_cursor();
				cursori -=1;
		if(event.is_action_pressed("ui_down")):
			if(cursori < maxitems):
				sfx_cursor();
				cursori += 1;
			
		if(event.is_action_pressed("ui_select")):
			sfx_select();
			
		if(event.is_action_pressed("ui_cancel")):
			sfx_back();
		
	
