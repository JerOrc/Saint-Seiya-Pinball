extends MPFSlide

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
  var style = _settings.tokens.style if _settings.tokens.has("style") else "default"
  var scene = scenes[style].preload
  var instance = scene.instantiate()
  
  if _settings.tokens.has("text1"):
    print("* LOG * ", _settings.tokens.text1)  

    if _settings.tokens.has("text2"):
      if _settings.tokens.has("text3"):
        instance.get_node("Labels/Label3/Label3-1").text = _settings.tokens.text1
        instance.get_node("Labels/Label3/Label3-2").text = _settings.tokens.text2
        instance.get_node("Labels/Label3/Label3-3").text = _settings.tokens.text3
        instance.get_node("Labels/Label3").visible = true
      else:
        instance.get_node("Labels/Label3/Label2-1").text = _settings.tokens.text1
        instance.get_node("Labels/Label3/Label2-2").text = _settings.tokens.text2
        instance.get_node("Labels/Label2").visible = true
    else:
      instance.get_node("Labels/Label1/Label1-1").text = _settings.tokens.text1
      instance.get_node("Labels/Label1").visible = true  
  else:
      instance.get_node("Label").text = _settings.tokens.text
      if _settings.tokens.has("bad"):
          instance.get_node("ColorRect").set("color", Color(0.733333, 0.14902, 0, 1))
      
  $zedmd.add_child(instance)
  await get_tree().create_timer(scenes[style].duration).timeout
  instance.queue_free()
