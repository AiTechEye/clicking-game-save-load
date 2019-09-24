extends Node2D

var save = {
	"clicks":0,
	"level":1,
	"lols":100,
}
# do not try to save in _ready, it doesn't work
func _ready():
	if load_data():
		get_node("CenterContainer/Button").set_text(str("You clicked: ",save.clicks, " times"))


# saves everyhing in the "save" variable
func save_data():
	var file = File.new()
	file.open("user://save",file.WRITE_READ)
	file.store_var(save)
	file.close()
	
# and load
func load_data():
	var file = File.new()
	if not file.file_exists("user://save"):
		return false
	file.open("user://save",file.READ)
	save = file.get_var()
	file.close()
	return true

func _on_Button_pressed():
	save.clicks += 1
	get_node("CenterContainer/Button").set_text(str("You clicked: ",save.clicks, " times"))
	save_data()