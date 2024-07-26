extends Control
signal levelUpDone

@onready var upgrade1 = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer
@onready var upgrade2 = $MarginContainer/HBoxContainer/MarginContainer3/VBoxContainer
@onready var upgrade3 = $MarginContainer/HBoxContainer/MarginContainer4/VBoxContainer

func _ready():
	var file = "res://player/upgrades.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var upgrades = JSON.parse_string(json_as_text)
	upgrades.shuffle()
	var up1 = upgrades.pop_front()
	var up2 = upgrades.pop_front()
	var up3 = upgrades.pop_front()
	
	upgrade1.get_child(0).text = up1.description
	upgrade1.get_child(1).pressed.connect(func():
		upgradeChoosen(up1.id)
	)
	upgrade2.get_child(0).text = up2.description
	upgrade2.get_child(1).pressed.connect(func():
		upgradeChoosen(up2.id)
	)
	upgrade3.get_child(0).text = up3.description
	upgrade3.get_child(1).pressed.connect(func():
		upgradeChoosen(up3.id)
	)

func upgradeChoosen(id: int):
	levelUpDone.emit(id)
