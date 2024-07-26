extends Node2D
signal onXpGained
signal onLvlGained

@onready var shoot_timer = $shootTimer
@onready var scale_component = $weapon/ScaleComponent
@onready var flash_component = $FlashComponent

var numberOfShoot = 1

func _ready():
	scale_component.scale_duration = shoot_timer.wait_time

func setPosition(pos):
	position = pos
#
func shoot():
	$weapon.shoot(numberOfShoot)

func xpGained(xp:int):
	$StatsComponent.xp += xp
	
	if ($StatsComponent.xp >= 1):
		$StatsComponent.xp = max(0, $StatsComponent.xp - 10)
		$StatsComponent.lvl += 1
		onLvlGained.emit($StatsComponent.lvl)
		
	onXpGained.emit($StatsComponent.xp)

func _on_stats_component_no_health():
	queue_free()

func _on_stats_component_health_changed():
	flash_component.flash()

func onUpgrade(upgradeId: int):
	match upgradeId:
		1:
			numberOfShoot += 1
