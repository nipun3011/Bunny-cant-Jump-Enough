extends AnimatedSprite

func _on_Player_animate(motion):
	if motion.x != 0:
		play("walk")
		if motion.x < 0:
			flip_h = true
		else:
			flip_h = false
		
	elif motion.y < 0:
		play("jump")
	else:
		play("idle")
