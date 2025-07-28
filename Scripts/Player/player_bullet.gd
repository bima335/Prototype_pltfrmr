extends Area2D

var direction = Vector2.RIGHT
var speed : int = 200
var damage = 10
var is_hit = false

func _ready() -> void:
	add_to_group("pausable")

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	call_deferred("queue_free")

func _on_body_entered(body: Node2D) -> void:
	if is_hit:
		return
	is_hit = true
	if body.is_in_group("enemies"):
		Controller.apply_damage(body, damage)
	set_physics_process(false)
	call_deferred("queue_free")
