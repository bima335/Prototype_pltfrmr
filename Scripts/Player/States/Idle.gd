extends PlayerState

func enter_state():
	player.velocity.x = 0
	
func update(delta):
	if Input.get_axis("left", "right") != 0:
		player.change_state(player.RUN)
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.change_state(player.JUMP)
	
	if Input.is_action_just_pressed("shoot"):
		player.change_state(player.SHOOT)
