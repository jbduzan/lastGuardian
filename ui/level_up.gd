extends Control
signal levelUpDone

@export var playerLevel: int

@onready var upgrade1 = $MarginContainer/HBoxContainer/MarginContainer2/VBoxContainer
@onready var upgrade2 = $MarginContainer/HBoxContainer/MarginContainer3/VBoxContainer
@onready var upgrade3 = $MarginContainer/HBoxContainer/MarginContainer4/VBoxContainer

var classicUpgradesType = 1;
var defensiveUpgradesType = 2;
var offsenivesUpgradesType = 3;

func _ready():
	var playerLevelStr = str(playerLevel)
	
	if playerLevelStr.ends_with('5'):
		defensivesUpgrades()
	elif playerLevelStr.ends_with('0'):
		offensivesUpgrades()
	else:
		classicUpgrades()

func defensivesUpgrades():
	var file = "res://player/defensiveUpgrades.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	select3RandomsUpgrades(JSON.parse_string(json_as_text), defensiveUpgradesType)

func offensivesUpgrades():
	var file = "res://player/offensiveUpgrades.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	select3RandomsUpgrades(JSON.parse_string(json_as_text), offsenivesUpgradesType)

func classicUpgrades():
	var file = "res://player/upgrades.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	select3RandomsUpgrades(JSON.parse_string(json_as_text), classicUpgradesType)

func select3RandomsUpgrades(upgrades: Array, upgradeType: int):
	var weightedUpgrades = []
	
	for upgrade in upgrades:
		var weight = 1
		
		if "weight" in upgrade:
			weight = upgrade.weight
		
		for i in range(weight):
			weightedUpgrades.append(upgrade)
	
	weightedUpgrades.shuffle()
	var up1 = weightedUpgrades.pop_front()
	var up2 = weightedUpgrades.pop_front()
	var up3 = weightedUpgrades.pop_front()
	
	if up1:
		upgrade1.get_child(0).text = up1.description
		upgrade1.get_child(1).pressed.connect(func():
			upgradeChoosen(up1.id, upgradeType)
		)
		
	if up2:
		upgrade2.get_child(0).text = up2.description
		upgrade2.get_child(1).pressed.connect(func():
			upgradeChoosen(up2.id, upgradeType)
		)
		
	if up3:
		upgrade3.get_child(0).text = up3.description
		upgrade3.get_child(1).pressed.connect(func():
			upgradeChoosen(up3.id, upgradeType)
		)
	
func upgradeChoosen(id: int, type: int):
	levelUpDone.emit(id, type)
