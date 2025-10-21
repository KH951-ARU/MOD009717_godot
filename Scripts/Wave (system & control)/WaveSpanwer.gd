extends Node
class_name SpawnerSystem

@export var Goblin : PackedScene
@export var Sketelon : PackedScene
@export var Beholder : PackedScene
var temp
@export var wave = 0
var status = 'idle'
signal wave_changed(int)


@export var spawnerIndex = 0
var sequneceIndex = 0
@export var waves: Array[Wave]


func spawn_next_waves():
	var N0_waves = waves.size()
	if wave > N0_waves or status == 'spawning':
		return
	status = 'spawning'
	emit_signal('wave_changed', wave)
	#for enemy in waves[wave].enemy_sequneces[sequneceIndex]:
	spawn_unit(waves[spawnerIndex].enemy_sequneces[sequneceIndex].EnemyIndex, waves[spawnerIndex].enemy_sequneces[sequneceIndex].time,waves[spawnerIndex].enemy_sequneces[sequneceIndex].amount)
		#status = 'idle'
		#wave += 1

func spawn_unit(enemy_index, time, amount):
	for i in amount:
		if enemy_index == 1:
			temp = Goblin.instantiate()
		elif enemy_index == 2:
			temp = Sketelon.instantiate()
		elif enemy_index == 3:
			temp = Beholder.instantiate()
		add_child(temp)
		await get_tree().create_timer(time).timeout
		
func _unhandled_input(_event):
	if  Input.is_action_just_pressed('Test'):
		spawn_next_waves()
