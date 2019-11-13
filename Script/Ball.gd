extends RigidBody2D

func _ready():
 contact_monitor = true
 set_max_contacts_reported(4)
 var BreakoutNode = get_node("/root/Breakout")
 var time = 0
 connect("score", BreakoutNode, "increase_score")
 connect("lives", BreakoutNode, "decrease_lives")

func _physics_process(delta):
 var sound = get_parent().get_node("CollisionNoise")
 var bodies = get_colliding_bodies()
 for body in bodies:
  sound.play()
  var angle = atan((linear_velocity.x/linear_velocity.y)) * 57.2958
  var emitter = get_parent().get_node("Hit")
  print(angle)
  if angle >= 0 and angle <= 90:
    emitter.position.x = position.x - 10
    emitter.position.y = position.y - 10
  elif angle >= -90 and angle <= 0:
    emitter.position.x = position.x + 10 
    emitter.position.y = position.y + 10 
  emitter.rotation_degrees = (-angle) 
  emitter.emitting = true
  if body.is_in_group("Tile"):
   var BreakoutNode = get_node("/root/Breakout")
   BreakoutNode.increase_score(body.score)
   body.queue_free()

 if position.y > get_viewport_rect().end.y:
  var BreakoutNode = get_node("/root/Breakout")
  BreakoutNode.decrease_lives()
  emit_signal("lives")
  queue_free()