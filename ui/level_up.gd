extends Control
signal levelUpDone

func _on_button_pressed():
	levelUpDone.emit()
	print("toto")
