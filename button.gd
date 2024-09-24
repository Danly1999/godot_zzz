extends Button

func _ready() -> void:
	var s = Callable(self,"grab_focus")
	s.call_deferred

func _button_pressed():
	print("Hello world!")
