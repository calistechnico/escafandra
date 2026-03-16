extends Node2D

func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	$CenterContainer/SettingsMenu/Fullscreen.button_pressed = true if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN else false
	$CenterContainer/SettingsMenu/MainVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	$CenterContainer/SettingsMenu/MusicVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("MUSIC")))
	$CenterContainer/SettingsMenu/SFXVolSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/World/abyss.tscn')


func _on_settings_pressed() -> void:
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/SettingsMenu.visible = true


func _on_credits_pressed() -> void:
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/CreditsMenu.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$CenterContainer/CreditsMenu.visible = false
	$CenterContainer/SettingsMenu.visible = false
	$CenterContainer/MainButtons.visible = true


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)


func _on_main_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)


func _on_music_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("MUSIC"), value)


func _on_sfx_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)
