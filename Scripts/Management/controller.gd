extends Node

const player = preload("res://Scenes/Player/player.tscn")
const area1 = preload("res://Scenes/Area/area_1.tscn")

var is_die = false
var wait_time := 0

var current_level = area1

func _ready() -> void:
	add_to_group("pausable")
	switch_scene()

func switch_scene():
	get_tree().change_scene_to_packed(current_level)

func toggle_pause():
	if is_die:
		wait_time = 1
	await get_tree().create_timer(wait_time).timeout
	get_tree().paused = !get_tree().paused
	for node in get_tree().get_nodes_in_group("pausable"):
		node.process_mode = Node.PROCESS_MODE_PAUSABLE if get_tree().paused else Node.PROCESS_MODE_INHERIT
