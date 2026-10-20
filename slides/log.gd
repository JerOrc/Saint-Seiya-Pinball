extends MPFSlide

var log_scenes
var effect_scenes 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  log_scenes = { 
    "default": {
        "preload": preload("res://scenes/log.tscn"),
        "duration": 2 
    },
    "lightning": {
        "preload": preload("res://scenes/lightning_log.tscn"),
        "duration": 2.5 
    },
  }

  effect_scenes = {
    "circle": {
      "preload": preload("res://scenes/circle.tscn"),
      "duration": PI/4 
    },
  }

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func log_text(_settings, _kwargs):
  var style = _settings.tokens.style if _settings.tokens.has("style") else "default"
  var scene = log_scenes[style].preload
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
  
  if _settings.tokens.has("bad") and style == "default":
    instance.get_node("ColorRect").set("color", Color(0.733333, 0.14902, 0, 1))
      
  $zedmd.add_child(instance)
  await get_tree().create_timer(log_scenes[style].duration).timeout
  instance.queue_free()


func effect(_settings, _kwargs): 
  var style = _settings.tokens.style if _settings.tokens.has("style") else "circle"
  var scene = effect_scenes[style].preload
  var instance = scene.instantiate()

  $zedmd.add_child(instance)
  await get_tree().create_timer(effect_scenes[style].duration).timeout
  instance.queue_free()
