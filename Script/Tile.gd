extends StaticBody2D

var score = 10

func _ready():
	var blue = load("res://Assets/blueTile.png")
	var red = load("res://Assets/redTile.png")
	var purple = load("res://Assets/purpleTile.png")
	var yellow = load("res://Assets/yellowTile.png")
	randomize()
	var type = randi() % 5 + 1
	if type == 1:
		get_node("Sprite").set_texture(blue)
		score = 10
	if type == 2:
		get_node("Sprite").set_texture(red)
		score = 20
	if type == 3:
		get_node("Sprite").set_texture(purple)
		score = 30
	if type == 4:
		get_node("Sprite").set_texture(yellow)
		score = 40
		
func _physics_process(delta):
	var end = 0
	if get_parent().name == "RowOne":
		end = 120
	if get_parent().name == "RowTwo":
		end = 170
	if get_parent().name == "RowThree":
		end = 220
	if get_parent().name == "RowFour":
		end = 270
	if not position.y > end: position = Vector2(position.x, position.y - 3*((position.y - end)/75))
		
			