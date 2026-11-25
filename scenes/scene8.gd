extends Node

@onready var next_scene = preload("res://scenes/scene9.tscn")

var texts = [
	"BEEP... BEEP... BEEP... Belelektronik sekolah bergema panjang, menandakan seluruh rangkaian jam pelajaran di hari pertama resmi berakhir."
]


func _ready() -> void:
	$Label.text = ""
	$Label.visible_characters = 0
	
	var text_length = 0
	
	for i in texts:
		$Label.visible_characters = 0
		$Label.text = i
		text_length = i.length()
		while $Label.visible_characters < text_length:
			$Label.visible_characters += 1
			await get_tree().create_timer(0.01).timeout
		
		await get_tree().create_timer(1).timeout
	
	Transitioner.fade_to(next_scene)
