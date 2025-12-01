extends Node2D
@export var WaveSpawnerSystem: SpawnerSystem
@export var EnermyScene :PackedScene
@export var path : Path2D
func _on_timer_timeout():
	WaveSpawnerSystem.spawn_next_waves()
