extends Node
class_name SpawnerSystem

@export var Goblin : PackedScene
@export var Sketelon : PackedScene
@export var Beholder : PackedScene
var temp
@export var currentWave = 0
@export var statusSpawning = false
@export var statusWin = false
signal wave_changed(int)
var wavecompleted : bool = false

@export var spawnerIndex = 0
var sequneceIndex = 0
@export var waves: Array[Wave]
@export var Nextwave: int = 1
var enermyCount
func spawn_next_waves():
	var N0_waves = waves.size()
	statusSpawning = true
	if  statusSpawning == true:
		print ("wave spawing")
		print("____" , statusSpawning)
		print("____" , currentWave)
		print("____" , spawnerIndex)
		print("____" , N0_waves)
		print("____" , wavecompleted)
		#print("____" , enermyCount)
		#_amountCheck()
		
		
	if statusSpawning == false :
		print("paused spawing")
		
		
		return
		if currentWave >= N0_waves:
			statusWin = true
	
	statusSpawning = true
	emit_signal('wave_changed', currentWave)
	#for horde in waves[currentWave].enemy_sequneces[sequneceIndex]:
	spawn_unit(waves[spawnerIndex].enemy_sequneces[sequneceIndex].EnemyIndex, waves[spawnerIndex].enemy_sequneces[sequneceIndex].time,waves[spawnerIndex].enemy_sequneces[sequneceIndex].amount)
	
	
	
	wavecompleted = true
	
	if statusSpawning == false :
		await get_tree().create_timer(60).timeout
		

func _amountCheck():
	enermyCount == waves[spawnerIndex].enemy_sequneces[sequneceIndex].amount
	#_waveOver()
	pass
 
func _GameOverWin():
	statusWin = true

func _GameOverLoss():
	statusWin = false

#func _NextWave():
	#Game.Round += 1
	#
	#Nextwave += 1
	#currentWave += 1
	#spawnerIndex += 1
#
#func _waveOver():
	#
	#if wavecompleted == true:
		#_NextWave()
		#wavecompleted = false
	#if wavecompleted == false:
		#pass
		

func _Resetwave():
	currentWave = 0

	await get_tree().create_timer(20).timeout


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
		


func  _endGame():
	pass
