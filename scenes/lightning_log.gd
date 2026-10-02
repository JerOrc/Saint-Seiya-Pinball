extends Control

@onready var video_player = $VideoStreamPlayer
@onready var shader_rect = $TextureRect

func _ready():
    var tex = video_player.get_video_texture()
    shader_rect.material.set_shader_parameter("video_tex", tex)
    video_player.play()
