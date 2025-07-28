extends CharacterBody2D

var hp : int

func take_damage(damage:int) -> void:
	hp -= damage
	print("hit, sisa", hp)
	
	if hp <= 0:
		queue_free()
