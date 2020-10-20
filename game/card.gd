extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum {APPLE,BANANA,BLACKBERRY,CHERRY,COCONUT,GRAPE,PINEAPPLE,STRAWBERRY}
var num: int
var type: int
var timer
#var texture
signal clicked
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout",self,"_on_timeout")

func _on_matched(var match1: int, var match2: int):
	if(match1 == num or match2 == num):
		queue_free()

func _on_unpicked(var unpick1:int, var unpick2: int):
	if(unpick1 == num or unpick2 == num):
		$fruit.visible = false

func _on_timeout():
	$fruit.visible = false
	timer.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func initialize(var n: int, var t: int):
	var texture
	num = n
	type = t
	match (type):
		APPLE:
			texture = ResourceLoader.load("res://images/apple.png")
		BANANA:
			texture = ResourceLoader.load("res://images/banana.png")
		BLACKBERRY:
			texture = ResourceLoader.load("res://images/blackberry.png")
		CHERRY:
			texture = ResourceLoader.load("res://images/cherry.png")
		COCONUT:
			texture = ResourceLoader.load("res://images/coconut.png")
		GRAPE:
			texture = ResourceLoader.load("res://images/grape.png")
		PINEAPPLE:
			texture = ResourceLoader.load("res://images/pineapple.png")
		STRAWBERRY:
			texture = ResourceLoader.load("res://images/strawberry.png")
	$fruit.texture = texture
	$fruit.visible = false
	
			
func _on_Area2D_input_event(viewport, event, shape_idx):
	#print("area event")
	if (event is InputEventMouseButton):
	#	print("Mouse event")
		if(event.is_action_released("leftclick")):
			$fruit.visible = true
			emit_signal("clicked",num)
			if($fruit.visible != true):
				print("??")
				$fruit.visible = true
				timer.start(.5)
			print(type)
