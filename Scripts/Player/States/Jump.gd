extends PlayerState

func enter_state():
	player.velocity.y = player.jump_force
func update(delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		player.velocity.x = lerp(player.velocity.x, player.run_speed * direction, 0.1)
	else:
		player.velocity.x = lerp(player.velocity.x, player.run_speed * direction, 0.1)
	
	if Input.is_action_just_pressed("dash"):
		player.change_state(player.DASH)
	
	if Input.is_action_just_pressed("shoot"):
		player.change_state(player.SHOOT)
	
	if player.is_on_floor():
		if abs(player.velocity.x) > 10:
			player.change_state(player.RUN)
		else:
			player.change_state(player.IDLE)
