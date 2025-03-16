class_name MainScene
extends Control

const BASE_MINER_COST : int = 10

var crystal_count : int
var energy_count : int
var metal_count : int
var miner_count : int
var miner_cost : float
var miner_price_index : float = 0.25

func _ready() -> void:
	crystal_count = 0
	updateCrystalCount()
	energy_count = 0
	updateEnergyCount()
	metal_count = 0
	updateMetalCount()
	miner_count = 0
	miner_cost = BASE_MINER_COST
	updateMinerCount()
	updateMinerCost()
	
	$GenerateCrystal.pressed.connect(_on_generate_crystal_pressed)
	$GenerateEnergy.pressed.connect(_on_generate_energy_pressed)
	$GenerateMetal.pressed.connect(_on_generate_metal_pressed)
	$PurchaseMiner.pressed.connect(_on_purchage_miner_pressed)
	$MinerTimer.timeout.connect(_on_miner_timer)

func addCrystal(qty : int) -> void:
	crystal_count += qty
	updateCrystalCount()

func addEnergy(qty : int) -> void:
	energy_count += qty
	updateEnergyCount()

func addMetal(qty : int) -> void:
	metal_count += qty
	updateMetalCount()

func addMiner() -> void:
	
	if metal_count < miner_cost:
		# add message to inform the user there is no enough resource to purchase a new miner
		return
		
	miner_count += 1
	metal_count -= miner_cost
	miner_cost = roundi(miner_cost * (1 + miner_price_index))
	updateMetalCount()
	updateMinerCost()
	updateMinerCount()
	
	if $MinerTimer.is_stopped():
		$MinerTimer.start()
		

func updateCrystalCount() -> void:
	$CrystalCountLabel.text = "Crystal : %s" %crystal_count

func updateEnergyCount() -> void:
	$EnergyCountLabel.text = "Energy : %s" %energy_count

func updateMetalCount() -> void:
	$MetalCountLabel.text = "Metal : %s" %metal_count

func updateMinerCost() -> void:
	$PurchaseMiner.text = "Cost : %s" %miner_cost

func updateMinerCount() -> void:
	$PurchaseMinerLabel.text = "Auto Miners : %s" %miner_count

func _on_generate_crystal_pressed() -> void:
	addCrystal(1)

func _on_generate_energy_pressed() -> void:
	addEnergy(1)

func _on_generate_metal_pressed() -> void:
	addMetal(1)

func _on_miner_timer() -> void:
	metal_count += miner_count
	updateMetalCount()

func _on_purchage_miner_pressed() -> void:
	addMiner()
		
