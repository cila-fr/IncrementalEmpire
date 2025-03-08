extends Control

var energy_count : int

func _ready() -> void:
	energy_count = 0
	$GenerateEnergyClick.pressed.connect(_on_generate_energy_click_pressed)

func addEnergy(qty : int) -> void:
	energy_count += qty

func _on_generate_energy_click_pressed() -> void:
	addEnergy(1)
	$EnergyCountLabel.text = "Energy : %s" %energy_count
