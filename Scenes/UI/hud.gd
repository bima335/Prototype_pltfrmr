extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	$Control/HP.text = "HP: %d"% Controller.Player_current_hp + "/%d"% Controller.Player_max_hp
