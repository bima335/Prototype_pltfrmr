extends "res://Scripts/Management/enemy_hit.gd"

var can_attack := false
var idle := true
var speed := 100
var towards

func _ready() -> void:
	add_to_group("enemies")
	add_to_group("pausable")
	hp = 50
	$AnimatedSprite2D.play("Idle")

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if can_attack:
		if !idle:
			if towards == "left":
				velocity.x = speed
	move_and_slide()
	await get_tree().create_timer(5).timeout
	set_physics_process(false)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		can_attack = true
		$AnimatedSprite2D.play("Stand")
		idle = false
		if body.global_position.x < global_position.x:
			towards = "left"
		else:
			towards = "right"
	else:
		return
