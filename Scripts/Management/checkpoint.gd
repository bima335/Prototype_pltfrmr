extends Area2D

var is_checked = false

func _on_body_entered(body: Node2D) -> void:
	if !is_checked:
		if body.name == "Player":
			Controller.Player_current_x_position = global_position.x
			Controller.Player_current_y_position = global_position.y
			Controller.Player_checkpoint_hp = Controller.Player_current_hp
			Controller.Player_checkpoint_bullet = Controller.Player_current_bullet
			Controller.is_checkpoint = true
			is_checked = true
