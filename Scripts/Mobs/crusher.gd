extends EnemyHit

var can_attack := false
var idle := true
var speed := 150
var towards
var start_position : Vector2
var max_distance : float = 100
var is_moving: bool = false

func _ready() -> void:
	add_to_group("enemies")
	add_to_group("pausable")
	hp = 50
	$AnimatedSprite2D.play("Idle")

func _physics_process(delta: float) -> void:
	var collide = move_and_collide(velocity * delta)
	velocity = Vector2.ZERO
	if can_attack:
		if !idle:
			if !is_moving:
				start_position = global_position
				is_moving = true
			var distance_traveled = start_position.distance_to(global_position)

			if distance_traveled < max_distance:
				if towards == "right":
					velocity.x = speed
				elif towards == "left":
					velocity.x = -speed
			else :
				velocity.x = 0
		else:
			is_moving = false
	else:
		is_moving = false
	if collide:
		if collide.get_collider().name == "Player":
			towards = "stop"
			Controller.is_die = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		can_attack = true
		$AnimatedSprite2D.play("Stand")
		if body.global_position.x < global_position.x:
			towards = "left"
		else:
			towards = "right"
		await get_tree().create_timer(2).timeout
		idle = false
	else:
		return
