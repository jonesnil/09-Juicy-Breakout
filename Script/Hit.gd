extends Particles2D

# Declare member variables here. Examples:
# var a = 2

var time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta): 
	if(emitting):
		time += 1
		if(time > 5):
			emitting = false
			time = 0
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass