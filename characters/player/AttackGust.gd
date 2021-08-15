extends Attack

export(float) var amount := 40.0
onready var stream: Resource = preload('res://audio/gust.wav')

func enter(host: Player) -> void:
	host.get_node('AnimationPlayer').play('AttackMedium')
	$Area2D.set_type_of_attack('MagicLight')
	$Area2D.set_amount(amount)
	.play_sound(host, stream)


#warning-ignore:unused_argument
func _on_Animation_finished(anim_name: String, host: Player) -> void:
	if not host.has_set_next_attack:
		emit_signal('finished', 'CombatIdle')
	else:
		emit_signal('finished', 'Idle')
