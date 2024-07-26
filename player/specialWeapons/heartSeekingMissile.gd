extends Node2D

@export var weaponMuzzlePosition: Vector2
@export var direction = Vector2(0, 0)
var speed = 300

func shoot(spawner: SpawnerComponent):
	var enemies = get_tree().get_nodes_in_group("enemies")
	enemies.sort_custom(func(a, b):
		var distanceA = a.position.distance_to(self.weaponMuzzlePosition)
		var distanceB = b.position.distance_to(self.weaponMuzzlePosition)
		return distanceA < distanceB
	)
	
	for i in range(10):
		var target = enemies.pop_front()
		
		if target:
			var targetRotation = self.weaponMuzzlePosition.angle_to_point(target.position)
			spawner.spawnWithRotation(targetRotation, self.weaponMuzzlePosition)
			
