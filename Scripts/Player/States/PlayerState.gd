extends Node

class_name  PlayerState

var player

func _ready() -> void:
	player = get_parent().get_parent()

func enter_state():
	pass

func exit_state():
	pass
	
func update(delta):
	pass
