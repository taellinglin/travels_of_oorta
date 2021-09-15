"""
Manage magic of the character.
"""
extends Node2D
class_name Magic

# signal emitted when the magic change
signal magic_changed(new_magic)
# signal emitted when the max magic change
signal max_magic_changed(new_magic)
# signal emitted when a character take damage
signal take_damage(alive, direction)
# signal emitted to "slow" the time when the character is hitted
signal momentum()

var magic
var max_magic

func _ready() -> void:
	magic =  PlayerStats.get_mp()
	max_magic = PlayerStats.get_max_mp()
	emit_signal('max_magic_changed', max_magic)
	emit_signal('magic_changed', magic)
	
	#warning-ignore:return_value_discarded
	self.connect('momentum', $'../Momentum', 'attack_momentum')


"""
Temporary function to simulate hit/recover magic
@TODO: To remove
"""
func _input(event: InputEvent) -> void:
	if ProjectSettings.get_setting('Debug/debug_mode'):
		if event.is_action_pressed('simulate_recover_magic'):
			recover_magic(25.0)

"""
Damage the character.

@param {float} amount - amount of magic to remove
@param {int} direction - computed direction where the character has been hit
"""

func drain_magic(amount: float) -> void:
	magic -= amount
	if magic < 0:
		magic = 0
	emit_signal('magic_changed', magic)
	
	print('%s recovered %s hit points. Hp: %s/%s' % [get_path(), amount, magic, max_magic])

func recover_magic(amount: float) -> void:
	magic += amount
	if magic > max_magic:
		magic = max_magic
	emit_signal('magic_changed', magic)
	
	print('%s recovered %s hit points. Hp: %s/%s' % [get_path(), amount, magic, max_magic])
