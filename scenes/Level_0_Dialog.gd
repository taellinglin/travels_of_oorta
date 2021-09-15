extends Sprite
class_name Interaction20

signal interaction(type)

const ALERT_SCENE: Resource = preload('res://interfaces/dialogue/AlertBox.tscn')
const NEXT_ALERT_SCENE: Resource = preload('res://interfaces/dialogue/AlertNextLevelBox.tscn')
export(String) var scene_path = ''
export(bool) var is_last_level = false
var near_npc = false

func _ready():
	$AlertTrigger.connect('body_entered', self, '_on_body_enter')
	$AlertTrigger.connect('body_exited', self, '_on_body_exit')
	set_process_input(true)

func _on_body_enter(body: Object) -> void:
	if body.get_collision_mask_bit(1):
		print("Player is by NPC")
		if body.is_grounded:
			get_parent().get_parent().get_node("Player/HUD/Tooltip").set_text("Press Up to talk...")
			get_parent().get_parent().get_node("Player/HUD/Tooltip").show();
			near_npc = true
		else:
			get_parent().get_parent().get_node("Player/HUD/Tooltip").hide();
			near_npc = false
				

func _on_NinePatchRect_finished():
	get_parent().get_parent().get_node("Player/HUD/PlayerLifeBar").visible = true
	get_parent().get_parent().get_parent().get_node("Interfaces/Dialog").visible = false
	get_parent().get_parent().get_node("Player/HUD/Tooltip").show()

func show_dialog():
	get_parent().get_parent().get_node("Player/HUD/Tooltip").hide()
	get_parent().get_parent().get_node("Player/HUD/PlayerLifeBar").visible = false
	get_parent().get_parent().get_parent().get_node("Interfaces/Dialog").visible = true
	#get_parent().get_parent().get_parent().get_node("Interfaces/Dialog/NinePatchRect").theme.set_font("Daemon","Dynamic Font")
	get_parent().get_parent().get_parent().get_node("Interfaces/Dialog/NinePatchRect").load_language("res://dialog/dialog_0.lan")
	get_parent().get_parent().get_parent().get_node("Interfaces/Dialog/NinePatchRect").show_text("Level0", "Frog", 0)


func _on_body_exit(body: Object) -> void:
	if body.get_collision_mask_bit(1):
		near_npc = false
		get_parent().get_parent().get_node("Player/HUD/Tooltip").hide();

func _input(event):
	if near_npc == true:
		if(event.is_action_pressed("move_up")):
			show_dialog()
