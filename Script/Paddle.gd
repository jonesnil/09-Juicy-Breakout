extends KinematicBody2D
var new_ball = preload("res://Scenes/Ball.tscn")

func _ready():
 set_process_input(true)

func _physics_process(delta):
 var mouse_x = get_viewport().get_mouse_position().x
 if not (position.x - mouse_x) > 20 and mouse_x > position.x:
    position = Vector2(position.x - 5*((position.x - mouse_x)/75), position.y)
 if not (position.x - mouse_x) < 20 and mouse_x < position.x:
    position = Vector2(position.x - 5*((position.x - mouse_x)/75), position.y)


func _input(event):
 if event is InputEventMouseButton and event.pressed:
  if not get_parent().has_node("Ball"):
   var ball = new_ball.instance()
   ball.position = position - Vector2(0, 32)
   ball.name = "Ball"
   ball.linear_velocity = Vector2(200, -200)
   get_parent().add_child(ball)
