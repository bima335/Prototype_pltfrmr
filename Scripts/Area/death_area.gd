extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Controller.is_die = true
		Controller.toggle_pause()
