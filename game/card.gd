extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum {APPLE,BANANA,BLACKBERRY,CHERRY,COCNUT,GRAPE,PINEAPPLE,STRAWBERRY}
var num: int
var type: int
signal clicked
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_matched(var match1: int, var match2: int):
	if(match1 == num or match2 == num):
		queue_free()

func _on_unpicked(var unpick1:int, var unpick2: int):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func initialize(var n: int, var t: int):
	num = n
	type = t
			
func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton):
		#print("Mouse event")
		if(event.is_action_released("leftclick")):
			emit_signal("clicked",num)
			print(type)
