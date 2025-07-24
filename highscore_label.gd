extends RichTextLabel

func _ready():
	
	if FileAccess.file_exists("user://points.txt"):
		
		var load_file = FileAccess.open("user://points.txt", FileAccess.READ)
		
		text += "PREV: " + load_file.get_line() + "\n"
		text += "HI: " + load_file.get_line()
