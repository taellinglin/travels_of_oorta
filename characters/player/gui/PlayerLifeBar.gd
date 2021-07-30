extends TextureRect

const LOW_HEALTH_TRIGGER = 25
const LOW_MAGIC_TRIGGER = 25
const HIGH_EXP_TRIGGER = 90
var is_health_low: bool = false
var is_magic_low: bool =  false
var is_exp_high: bool = false


func _ready() -> void:
	$AnimationPlayer.connect('animation_finished', self, '_on_Animation_finished')
	if get_parent().get_parent().has_node('Health'):
		get_parent().get_parent().get_node('Health').connect('health_changed', self, '_on_Health_changed')
	$AnimationPlayer2.connect('animation_finished', self, '_on_Animation_finished')
	if get_parent().get_parent().has_node('Magic'):
		get_parent().get_parent().get_node('Magic').connect('magic_changed', self, '_on_Magic_changed')


func _on_Health_changed(health_value: float) -> void:
	$TextureProgress.update_value(health_value)
	$hp.text = ("Hp:" + str(health_value))
	is_health_low = health_value <= LOW_HEALTH_TRIGGER
	$AnimationPlayer.play("Hit")

	
func _on_Magic_changed(magic_value: float) -> void:
	$TextureProgress2.update_value(magic_value)
	is_magic_low = magic_value <= LOW_MAGIC_TRIGGER
	#$AnimationPlayer.play('Flash')
	
func _on_Exp_changed(exp_value: float) -> void:
	$TextureProgress3.update_value(exp_value)
	is_exp_high = exp_value >= HIGH_EXP_TRIGGER

func _on_Animation_finished(anim_name: String) -> void:
	match anim_name:
		'Shake':
			if is_health_low:
				$AnimationPlayer.play('Flash')
		'Flash':
			if not is_health_low:
				$AnimationPlayer.stop('Flash')
	
