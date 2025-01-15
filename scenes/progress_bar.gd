extends ProgressBar

var exp_percent : float = 0
var current_exp : float = 1
var exp_required : float = 2

func update_exp_bar():
	current_exp = Stats.current_exp
	exp_required = Stats.exp_required
	exp_percent = calc()
	self.value = exp_percent
	
	

func calc():
	return current_exp/exp_required

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_exp_bar()
