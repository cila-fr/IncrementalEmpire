class_name MainScene
extends Control

var crystal_count : int
var energy_count : int
var metal_count : int

func _ready() -> void:
	crystal_count = 0
	updateCrystal()
	energy_count = 0
	updateEnergy()
	metal_count = 0
	updateMetal()
	
	$GenerateCrystal.pressed.connect(_on_generate_crystal_pressed)
	$GenerateEnergy.pressed.connect(_on_generate_energy_pressed)
	$GenerateMetal.pressed.connect(_on_generate_metal_pressed)

func addCrystal(qty : int) -> void:
	crystal_count += qty
	updateCrystal()

func addEnergy(qty : int) -> void:
	energy_count += qty
	updateEnergy()

func addMetal(qty : int) -> void:
	metal_count += qty
	updateMetal()

func updateCrystal() -> void:
	$CrystalCountLabel.text = "Crystal : %s" %crystal_count

func updateEnergy() -> void:
	$EnergyCountLabel.text = "Energy : %s" %energy_count

func updateMetal() -> void:
	$MetalCountLabel.text = "Metal : %s" %metal_count

func _on_generate_crystal_pressed() -> void:
	addCrystal(1)

func _on_generate_energy_pressed() -> void:
	addEnergy(1)

func _on_generate_metal_pressed() -> void:
	addMetal(1)
