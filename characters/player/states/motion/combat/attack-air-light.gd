extends AirAttack

export(float) var amount := 10.0

onready var stream: Resource = preload('res://audio/attack.wav')

func enter(host: Player) -> void:
	host.get_node('AnimationPlayer').play('AttackAirLight')	
	host.gravity_enable = false
	host.velocity = Vector2(0, 0)
	$DamageZone.set_type_of_attack('Light')
	$DamageZone.set_amount(amount)
	.play_sound(host, stream)


#warning-ignore:unused_argument
func _on_Animation_finished(anim_name: String, host: Player) -> void:
	if not host.has_set_next_attack:
		emit_signal('finished', 'Fall')
	else:
		emit_signal('finished', 'AttackAirMedium')
