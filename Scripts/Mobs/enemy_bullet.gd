extends Area2D

var direction := Vector2.RIGHT
@export var BULLET_SPEED := 200

func _ready() -> void:
	add_to_group("pausable")

func _physics_process(delta: float) -> void:
	position += direction * BULLET_SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Controller.is_die = true
		Controller.toggle_pause()
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
