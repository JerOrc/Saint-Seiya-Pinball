extends MPFSlide


var scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  scene = preload("res://scenes/log.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func log_text(_settings, _kwargs):
  # print("player score : " + $zedmd/MPFVariable.text)
  var instance = scene.instantiate()
  instance.get_node("Label").text = _settings.tokens.text
  $zedmd.add_child(instance)
  await get_tree().create_timer(1).timeout
  instance.queue_free()
