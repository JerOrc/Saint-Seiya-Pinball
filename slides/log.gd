extends MPFSlide

var scene
var style
var scenes = { 
  "default": {
      "preload": preload("res://scenes/log.tscn"),
      "duration": 2 
  },
  "lightning": {
      "preload": preload("res://scenes/lightning_log.tscn"),
      "duration": 2.5 
  },

}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func log_text(_settings, _kwargs):
  style = _settings.tokens.style if _settings.tokens.has("style") else "default"
  scene = scenes[style].preload

  print("* LOG * ", _settings.tokens.text)
  var instance = scene.instantiate()
  instance.get_node("Label").text = _settings.tokens.text
  $zedmd.add_child(instance)
  await get_tree().create_timer(scenes[style].duration).timeout
  instance.queue_free()
