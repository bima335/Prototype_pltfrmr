extends CharacterBody2D

var hp : int

func take_damage(damage:int) -> void:
	hp -= damage
	print("hit, sisa", hp)
	
	if hp <= 0:
		set_physics_process(false)
		call_deferred("queue_free")
