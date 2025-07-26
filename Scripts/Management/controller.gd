extends Node

const player = preload("res://Scenes/Player/player.tscn")
const area1 = preload("res://Scenes/Area/area_1.tscn")

var current_level = area1

func _ready() -> void:
	switch_scene()

func switch_scene():
	get_tree().change_scene_to_packed(current_level)
