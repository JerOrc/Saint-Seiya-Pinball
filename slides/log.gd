extends MPFSlide

var log_scenes
var effect_scenes 
var _MPF
var _current_player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  _MPF = MPF
  _current_player = MPF.game.player
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
    "double_circle": {
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
        instance.get_node("Labels/Label3/Label3-1").text = _evaluate(_settings.tokens.text1)
        instance.get_node("Labels/Label3/Label3-2").text = _evaluate(_settings.tokens.text2)
        instance.get_node("Labels/Label3/Label3-3").text = _evaluate(_settings.tokens.text3)
        instance.get_node("Labels/Label3").visible = true
      else:
        instance.get_node("Labels/Label3/Label2-1").text = _evaluate(_settings.tokens.text1)
        instance.get_node("Labels/Label3/Label2-2").text = _evaluate(_settings.tokens.text2)
        instance.get_node("Labels/Label2").visible = true
    else:
      instance.get_node("Labels/Label1/Label1-1").text = _evaluate(_settings.tokens.text1)
      instance.get_node("Labels/Label1").visible = true  
  else:
      instance.get_node("Label").text = _evaluate(_settings.tokens.text)
  
  if _settings.tokens.has("bad") and style == "default":
    instance.get_node("ColorRect").set("color", Color.html('c72227'))
      
  $zedmd.add_child(instance)
  await get_tree().create_timer(log_scenes[style].duration).timeout
  instance.queue_free()


func effect(_settings, _kwargs): 
  var instance2
  var style = _settings.tokens.style if _settings.tokens.has("style") else "circle"
  var scene = effect_scenes[style].preload
  var instance = scene.instantiate()
  $zedmd.add_child(instance)

  if style == "double_circle":
    await get_tree().create_timer(0.1).timeout
    instance2 = scene.instantiate()
    $zedmd.add_child(instance2)
    await get_tree().create_timer(effect_scenes[style].duration).timeout
    instance.queue_free()
    instance2.queue_free()
  else:      
    await get_tree().create_timer(effect_scenes[style].duration).timeout
    instance.queue_free()


func _evaluate(command: String, variable_names = [], variable_values = []) -> String:
  if command.begins_with('='):
    command = command.substr(1)
    if command.contains('['): 
      #var debut_expression = 0
      #var fin_expression = 0
      #while command.find('[', debut_expression) >= 0:
        #debut_expression = command.find('[', fin_expression)
        #fin_expression = command.find(']', debut_expression)
        #variable_names.append(command.substr(debut_expression, fin_expression - debut_expression + 1))
        #debut_expression = fin_expression
      #var var_clean_name
      #var var_value
      #for var_name in variable_names:
        #var_clean_name = var_name.substr(1, var_name.length() - 2)
        #var_value = _MPF.game.player.get(var_clean_name)
        #variable_values.append(var_value)
      command = command.replace('[', "_current_player.get('")
      command = command.replace(']', "')")
      
    var expression = Expression.new()
    var error = expression.parse(command, variable_names)
    if error != OK:
      push_error(expression.get_error_text())
      return command
    var result = expression.execute(variable_values, self)
    if not expression.has_execute_failed():
      return result     
  return command


func format_big_number(number: int)-> String:
  var num_str: String = str(number)
  var result: String = ""
  var count: int = 0
  
  for i in range(num_str.length() - 1, -1, -1):
    result = num_str[i] + result
    count += 1
    if count % 3 == 0 and i != 0:
      result = "." + result
  return result
  
