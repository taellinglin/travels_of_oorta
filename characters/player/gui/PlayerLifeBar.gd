extends TextureRect

const LOW_HEALTH_TRIGGER = 25
const LOW_MAGIC_TRIGGER = 25
const HIGH_EXP_TRIGGER = 90
var is_health_low: bool = false
var is_magic_low: bool =  false
var is_exp_high: bool = false

func _ready() -> void:
	$AnimationPlayer.connect('animation_finished', self, '_on_Animation_finished')
	if get_parent().get_parent().has_node('Hp'):
		get_parent().get_parent().get_node('Hp').connect('hp_changed', self, '_on_Hp_changed')
	$AnimationPlayer2.connect('animation_finished', self, '_on_Animation_finished')
	if get_parent().get_parent().has_node('Mp'):
		get_parent().get_parent().get_node('Mp').connect('mp_changed', self, '_on_Mp_changed')
	$AnimationPlayer3.connect('animation_finished', self, '_on_Animation_finished')
	if get_parent().get_parent().has_node('Xp'):
		get_parent().get_parent().get_node('Xp').connect('xp_changed', self, '_on_Xp_changed')
	PlayerStats.connect("hp_changed", self, '_on_Hp_changed')
	PlayerStats.connect("mp_changed", self, '_on_Mp_changed')
	PlayerStats.connect("xp_changed", self, '_on_Xp_changed')
	PlayerStats.connect("level_changed", self, '_on_Level_changed')	
	
	
	#Init HP	
	$TextureProgress.max_value = PlayerStats.get_max_hp()
	print("PlayerStats.hp: ", PlayerStats.get_hp())
	$TextureProgress.update_value(PlayerStats.get_hp())
	$hp.text = ("HP:" + str(PlayerStats.get_hp()/PlayerStats.get_max_hp()))
	
	#Init MP
	$TextureProgress2.max_value = PlayerStats.get_max_mp()
	print("PlayerStats.mp: ", PlayerStats.get_mp())
	$TextureProgress2.update_value(PlayerStats.get_mp())
	$mp.text = ("MP:" + str(PlayerStats.get_mp()/PlayerStats.get_max_mp()))
	
	#Init XP
	$TextureProgress3.max_value = PlayerStats.get_max_xp()
	print("PlayerStats.xp: ", PlayerStats.get_xp())
	$TextureProgress3.update_value(PlayerStats.get_xp())
	$xp.text = ("XP:" + str(PlayerStats.get_xp()/PlayerStats.get_max_xp()))

func _on_Hp_changed(health_value: float) -> void:
	print("PlayerStats.hp: ", PlayerStats.get_hp())
	print("Health Value: ", health_value)
	$TextureProgress.max_value = PlayerStats.get_max_hp()
	#PlayerStats.set_hp(health_value)
	$TextureProgress.update_value((PlayerStats.get_hp()/PlayerStats.get_max_hp())*PlayerStats.get_max_hp())
	$hp.text = ("HP:" + str(PlayerStats.get_hp()/PlayerStats.get_max_hp()))
	is_health_low = health_value <= LOW_HEALTH_TRIGGER
	$AnimationPlayer.play("Hit")

	
func _on_Mp_changed(magic_value: float) -> void:
	$TextureProgress2.max_value = PlayerStats.get_max_mp()
	#PlayerStats.set_mp(magic_value)
	$TextureProgress2.update_value(PlayerStats.get_mp())
	$mp.text = ("MP:" + str(PlayerStats.get_mp()/PlayerStats.get_max_mp()))

	is_magic_low = magic_value <= LOW_MAGIC_TRIGGER
	#$AnimationPlayer.play('Flash')
	
func _on_Xp_changed(exp_value: float) -> void:
	$TextureProgress3.max_value = PlayerStats.get_max_xp()
	#PlayerStats.set_xp(exp_value)
	$TextureProgress3.update_value(PlayerStats.get_xp())
	$xp.text = ("XP:" + str(PlayerStats.get_xp()/PlayerStats.get_max_xp()))
	is_exp_high = exp_value >= HIGH_EXP_TRIGGER
	
func _on_Level_changed(new_level: int) -> void:
	if (new_level <= PlayerStats.max_level):
		#PlayerStats.set_player_level(new_level)
		$level.text = ("Lv: " + str(PlayerStats.get_player_level()))

func _on_Animation_finished(anim_name: String) -> void:
	match anim_name:
		'Shake':
			if is_health_low:
				$AnimationPlayer.play('Flash')
		'Flash':
			if not is_health_low:
				$AnimationPlayer.stop('Flash')
	
