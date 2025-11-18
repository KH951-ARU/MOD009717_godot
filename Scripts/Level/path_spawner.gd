extends Node2D
@export var WaveSpawnerSystem: SpawnerSystem
@export var EnermyScene :PackedScene
@export var path : Path2D
func _on_timer_timeout():
	WaveSpawnerSystem.spawn_next_waves()
	
	if WaveSpawnerSystem.waves == null:
		print(WaveSpawnerSystem.currentWave)
		WaveSpawnerSystem.currentWave + 1
		WaveSpawnerSystem.spawn_next_waves()
