extends Control

var time: int = 0
var started = false

func _ready():
	OS.window_size = $C.rect_size
	update_time_display()
	set_button_state()


func _on_Timer_timeout():
	time += 1
	update_time_display()


func update_time_display():
	# warning-ignore:integer_division
	$C/VB/Label.text = "%02d:%02d" % [time / 60, time % 60]


func _on_Stop_pressed():
	if started:
		$Timer.stop()
	else:
		$Timer.start()
	started = !started
	set_button_state()


func _on_Reset_pressed():
	time = 0
	update_time_display()
	if started:
		$Timer.start()


func set_button_state():
	if started:
		$C/VB/HB/Stop.text = "STOP"
	else:
		$C/VB/HB/Stop.text = "START"
