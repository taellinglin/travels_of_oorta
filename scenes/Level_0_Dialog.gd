extends Sprite
class_name Interaction20

signal interaction(type)

const ALERT_SCENE: Resource = preload('res://interfaces/dialogue/AlertBox.tscn')
const NEXT_ALERT_SCENE: Resource = preload('res://interfaces/dialogue/AlertNextLevelBox.tscn')
export(String) var scene_path = ''
export(bool) var is_last_level = false


func _ready():
	$AlertTrigger.connect('body_entered', self, '_on_body_enter')


func _on_body_enter(body: Object) -> void:
	if body.get_collision_mask_bit(1):
		if body.is_grounded:
			get_parent().get_parent().get_node("Player/HUD/PlayerLifeBar").visible = false
			get_parent().get_parent().get_parent().get_node("Interfaces/Dialog").visible = true
			#get_parent().get_parent().get_parent().get_node("Interfaces/Dialog/NinePatchRect").theme.set_font("Daemon","Dynamic Font")
			get_parent().get_parent().get_parent().get_node("Interfaces/Dialog/NinePatchRect").load_language("res://dialog/dialog_0.lan")
			get_parent().get_parent().get_parent().get_node("Interfaces/Dialog/NinePatchRect").show_text("00", "00", 0)


func _on_NinePatchRect_finished():
	get_parent().get_parent().get_node("Player/HUD/PlayerLifeBar").visible = true
	get_parent().get_parent().get_parent().get_node("Interfaces/Dialog").visible = false
