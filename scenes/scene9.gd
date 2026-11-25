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
	],
	[
		"Kamu mengingatkan Alya tentang jadwal pelajaran praktek besok. Dia tertawa kecil, lalu mengutarakan bahwa memiliki rekan belajar yang teratur membuat suasana sekolah terasa jauh lebih tenang."
	],
	[
		"Langkah kalian terhenti di dekat papan pengumuman interaktif yang menampilkan daftar kegiatan ekstrakurikuler sekolah. Kamu mengamati layar tersebut lalu menanyakan apakah ada klub atau kegiatan pengembangan diri yang menarik perhatiannya."
	],
	[
		"Kamu membagikan sudut pandangmu mengenai pentingnya memilih kegiatan yang seimbang antara akademik dan hobi pribadi agar masa sekolah tidak terasa menjenuhkan."
	],
	[
		"Langkah kalian melintasi depan ruang perpustakaan dua lantai yang megah dengan dinding kaca transparan. Kamu menghentikan langkah sejenak dan mengutarakan bahwa fasilitas perpustakaan sekolah ini terlihat sangat lengkap dan nyaman untuk tempat belajar."
	],
	[
		"Kamu menyambut positif usulannya dan menyampaikan bahwa membaca di tempat sehening itu pasti akan sangat efektif."
	],


]


func _ready() -> void:
	$Label.text = ""
	$Label.visible_characters = 0
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
	$Label.text = ""
	$Label.visible_characters = 0

func end():
	Transitioner.fade_to(next_scene)
