extends Control

var energy_count : int

func _ready() -> void:
	energy_count = 0
	

func addEnergy(e : int) -> void:
	energy_count += e
	

func _on_generate_energy_click_pressed() -> void:
	addEnergy(1)
	$EnergyCount.text = "Energy : %s" %energy_count
