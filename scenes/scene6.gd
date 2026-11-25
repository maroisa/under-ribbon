extends Node

@onready var next_scene = preload("res://scenes/scene7.tscn")

var texts = [
	"Kalian berdua melangkah masuk kembali ke dalam ruang kelas yang sejuk. Masing-masing dari kalian mengambil posisi duduk di bangku yang telah ditentukan sebelumnya.",
	"Tak lama kemudian, seorang guru pengajar melangkah masuk membawa laptop dan menyalakan layar proyektor di depan kelas. Suasana ruangan mendadak hening dan tertib."
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
