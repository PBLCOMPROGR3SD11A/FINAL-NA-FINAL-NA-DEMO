extends Node 

export (NodePath) var animator
export (NodePath) var RealButtonPath
export (NodePath) var FakeButtonPath 
export (String) var fact
export (bool) var answer

func _Real_Button_pressed():
	$News_1.hide()
	if _Real_Button_pressed():
		animator.play("RealSlide")

func _Fake_Button_pressed():
	$News_1.hide()
	if _Fake_Button_pressed():
		animator.play("FakeSlide")
