extends Node2D

export var score = 0
export var lives = 3

func increase_score(s):
 score += int(s)
 find_node("Score").update_score()
 
func decrease_lives():
 lives -= 1
 find_node("Lives").update_lives()
 if lives <= 0:
  get_tree().change_scene("res://Scenes/End.tscn")

func _physics_process(delta):
	if not has_node("Tiles"):
		var ball = get_node("Ball")
		var speed = ball.linear_velocity.x
		get_tree().reload_current_scene()
		ball.linear_velocity = Vector2(speed*1.5, speed*1.5) 
		