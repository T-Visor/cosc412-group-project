extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum {APPLE,BANANA,BLACKBERRY,CHERRY,COCONUT,GRAPE,PINEAPPLE,STRAWBERRY}

var board: Array  = [APPLE,BANANA,BLACKBERRY,CHERRY,COCONUT,GRAPE,PINEAPPLE,STRAWBERRY,APPLE,BANANA,BLACKBERRY,CHERRY,COCONUT,GRAPE,PINEAPPLE,STRAWBERRY]
var cardscene = preload("res://card.tscn")
# Called when the node enters the scene tree for the first time.

var lastClicked = -1
signal matched
signal unpick

func _ready():
	board.shuffle()
	# Center window on screen
	var screen_size = OS.get_screen_size(OS.get_current_screen())
	var window_size = OS.get_window_size()
	var centered_pos = (screen_size - window_size) / 2
	OS.set_window_position(centered_pos)
	var blocksize = Vector2(window_size.x/5,window_size.y/5)
	print(blocksize)
	var blockcenter = Vector2(blocksize.x,blocksize.y)
	var temp = blocksize
	var counterx = 0
	var countery = 1
	var count = 0
	for i in board:
		var newcard = cardscene.instance()
		add_child(newcard)
		newcard.set_position(blockcenter)
		connect("matched",newcard,"_on_matched")
		connect("unpick",newcard,"_on_unpicked")
		newcard.connect("clicked",self,"onCardClicked")
		newcard.initialize(count,i)
		counterx+=1
		if(counterx<4):
			temp.x += blocksize.x
		else:
			countery += 1
			temp = Vector2(blocksize.x,countery*blocksize.y)
			counterx = 0
		blockcenter = Vector2(temp.x,temp.y)
		count += 1
		print(blockcenter)
	var v1 = Vector3(1,-5,2)
	var v2 = Vector3(0,4,-1)
	print(v1.dot(v2))
	
	#pass # Replace with function body.


func onCardClicked(cardnum):
	if(lastClicked != -1):
		if(board[lastClicked] == board[cardnum] and lastClicked != cardnum):
			emit_signal("matched",lastClicked,cardnum)
			#board.remove(lastClicked)
			#board.remove(cardnum)
			lastClicked = -1
		else:
			emit_signal("unpick",lastClicked,cardnum)
			lastClicked = -1
	else:
		lastClicked = cardnum
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
		
		
	#for card in board:
	pass
