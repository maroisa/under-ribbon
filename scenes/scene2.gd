extends Node

var texts = [
	"Satu per satu murid mulai dipanggil ke depan kelas. Suasana ruangan mendadak hening dipenuhi rasa penasaran setiap kali seseorang melangkah maju, hingga akhirnya wali kelas membaca nama yang tercantum di daftar hadir berikutnya.",
	"\"Selanjutnya, Alya Kirana.\""
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
	
	Transitioner.fade_to("res://scenes/scene3.tscn")
