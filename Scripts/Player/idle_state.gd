extends State

class_name IdleState

func enter():
	print("Entering Idle State")

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
