extends MPFSlide

func log_text(_settings, _kwargs):
  $zedmd/Label.text = _settings.tokens.text
  $zedmd.visible = true
  await get_tree().create_timer(1).timeout
  $zedmd.visible = false
