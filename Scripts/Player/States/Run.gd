extends PlayerState

func update(delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		player.velocity.x = lerp(player.velocity.x, player.run_speed * direction, 0.1)
	else:
		player.velocity.x = lerp(player.velocity.x, player.run_speed * direction, 0.1)
		
	if direction == 0:
		player.change_state(player.IDLE)
	
	if Input.is_action_just_pressed("jump"):
		player.change_state(player.JUMP)
		
	if Input.is_action_just_pressed("dash"):
		player.change_state(player.DASH)

	if Input.is_action_just_pressed("shoot"):
		player.change_state(player.SHOOT)
