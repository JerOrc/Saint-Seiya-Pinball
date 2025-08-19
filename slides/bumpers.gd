extends MPFSlide

var scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  scene = preload("res://widgets/bumpers.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func top_down_text(_settings, _kwargs):
  # print("player score : " + $zedmd/MPFVariable.text)
  var instance = scene.instantiate()
  instance.get_node("bumper_text").text = "Bumper hit \n+ " + $zedmd/MPFVariable.text
  $zedmd.add_child(instance)
  await get_tree().create_timer(0.5).timeout
  instance.queue_free()
