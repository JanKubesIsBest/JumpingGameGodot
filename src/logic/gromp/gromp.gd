extends gromp

func _on_Area2D_body_entered(body):
	speed = speed * -1
	velocity.x = -1 * speed
