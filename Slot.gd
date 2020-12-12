extends Panel

var ItemClass = preload("res://Items.tscn")
var item = null

func _ready():
	item = ItemClass.instance()
	add_child(item)
