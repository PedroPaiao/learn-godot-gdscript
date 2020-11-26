extends CanvasLayer

var coins = 0

func _ready():
	$Coins.text = String(coins)

# Essa função vai fazer com que saibamos
# as moedas coletadas

func _on_Coin_coin_collected():
	coins += 1
	_ready()
	
	if(coins == 3):
		get_tree().change_scene("res://scenes/level1.tscn")
