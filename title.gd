extends Label

var tab = null

func _process(delta):
	tab = get_parent().get_node("Tabs").current_tab
	
	if tab == 0:
		text = """COMPANY: ADZW
		CURRENT STOCK PRICE: """
		get_parent().get_node("box2").show()
		get_parent().get_node("data").show()
		get_parent().get_node("buy stock").show()
		get_parent().get_node("buy stock").disabled = false
		get_parent().get_node("sell stock").show()
		get_parent().get_node("sell stock").disabled = false
		get_parent().get_node("news").hide()
		get_parent().get_node("news_title").hide()
	elif tab == 1:
		text = """COMPANY: ADZW
		LATEST NEWS: """
		get_parent().get_node("box2").hide()
		get_parent().get_node("data").hide()
		get_parent().get_node("buy stock").hide()
		get_parent().get_node("buy stock").disabled = true
		get_parent().get_node("sell stock").hide()
		get_parent().get_node("sell stock").disabled = true
		get_parent().get_node("news").show()
		get_parent().get_node("news_title").show()
