extends Node

@onready var next_scene = preload("res://scenes/main_menu.tscn")

var dialogue = preload("res://assets/dialogue/scene9.dialogue")

var texts = [
	[
		"Kamu memilih untuk merapikan alat-alat tulismu tanpa menunda waktu. Setelah memasukkan seluruh perlengkapan ke dalam tas, kamu berdiri dari tempat dudukmu.",
		"Kamu menyunggingkan senyum tipis dan berpamitan secara santun pada Alya, menyampaikannya bahwa kamu akan pulang terlebih dahulu."
	],
	[
		"Kamu beranjak dari tempat dudukmu sembari menyampirkan tas di pundak. Kamu mengusulkan pada Alya untuk berjalan keluar bersama menyusuri lorong kelas sembari menikmati suasana sore sekolah.",
		"Alya tampak menyambut baik usulan tersebut. Ia berdiri, merapikan seragamnya, lalu berjalan beriringan bersamamu melangkah keluar dari ruang kelas."
	]
]


func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue)

func play_text(choice: int) -> void:
	$Label.text = ""
	$Label.visible_characters = 0
	
	var text_length = 0
	
	for i in texts[choice]:
		$Label.visible_characters = 0
		$Label.text = i
		text_length = i.length()
		while $Label.visible_characters < text_length:
			$Label.visible_characters += 1
			await get_tree().create_timer(0.01).timeout
		
		await get_tree().create_timer(1).timeout

func end():
	Transitioner.fade_to(next_scene)
