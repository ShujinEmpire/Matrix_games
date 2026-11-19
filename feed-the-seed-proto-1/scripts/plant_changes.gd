extends Node2D
@onready var plant_sprout_sprite: Sprite2D = $PlantSproutSprite
@onready var seed_sprite: Sprite2D = $SeedSprite
@onready var plant_pot_sprite: Sprite2D = $PlantPotSprite

func plant_sprout() -> void:
	seed_sprite.hide()
	plant_sprout_sprite.show()

func plant_seed() -> void:
	plant_pot_sprite.hide()
	seed_sprite.show()
