extends PlayerState

var dash_direction: Vector2

func enter_state():
	player.dash_timer = player.dash_duration
	dash_direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()

	if dash_direction == Vector2.ZERO:
		dash_direction = Vector2(1 if player.is_facing_right else -1, 0)
		
	player.velocity = dash_direction * player.dash_speed

func update(delta):
	player.dash_timer -= delta

	if player.dash_timer <= 0:
		if player.previous_state == player.JUMP and !player.is_on_floor():
			player.change_state(player.JUMP)
		else:
			player.change_state(player.IDLE if player.velocity.x == 0 else player.RUN)
