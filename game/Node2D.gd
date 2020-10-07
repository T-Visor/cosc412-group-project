extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum {APPLE,BANANA,BLACKBERRY,CHERRY,COCNUT,GRAPE,PINEAPPLE,STRAWBERRY}

var board: Array  = [APPLE,BANANA,BLACKBERRY,CHERRY,COCNUT,GRAPE,PINEAPPLE,STRAWBERRY,APPLE,BANANA,BLACKBERRY,CHERRY,COCNUT,GRAPE,PINEAPPLE,STRAWBERRY]
var cardscene = preload("res://card.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	board.shuffle()
	var size = OS.get_window_size()
	var blocksize = Vector2(size.x/4,size.y/4)
	print(blocksize)
	var blockcenter = Vector2(blocksize.x,blocksize.y)
	var temp = blocksize
	var counterx = 0
	var countery = 1
	for i in board:
		var newcard = cardscene.instance()
		add_child(newcard)
		newcard.set_position(blockcenter)
		counterx+=1
		if(counterx<4):
			temp.x += blocksize.x
		else:
			countery += 1
			temp = Vector2(blocksize.x,countery*blocksize.y)
			counterx = 0
		blockcenter = Vector2(temp.x,temp.y)
		print(blockcenter)
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
		
		
	#for card in board:
	pass
