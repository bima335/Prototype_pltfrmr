extends Node

signal Player_hitted(damage)
signal Enemy_hitted(hp)

const player = preload("res://Scenes/Player/player.tscn")
const area1 = preload("res://Scenes/Area/area_1.tscn")

@export var Player_hp = 100

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

func apply_damage(enemy_node: Node, damage: int) -> void:
	if enemy_node.has_method("take_damage"):
		enemy_node.take_damage(damage)
	else:
		print("Tidak ada take_damage")


func _on_player_hitted(damage: Variant) -> void:
	Player_hp = Player_hp - damage
	if Player_hp <= 0:
		is_die = true
		toggle_pause()
