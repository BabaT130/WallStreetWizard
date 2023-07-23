extends Label

var random = RandomNumberGenerator.new()
var story = ""
var news = false
var tab = null
var down_news = ["Rumours abound about ADZW's \
stock showing signs of volatility, \
causing uncertainty among investors. Market analysts are closely \
monitoring the situation, speculating on the potential factors that may be driving this fluctuation. \
The company's recent product releases or strategic partnerships could play a pivotal role in determining the \
stock's future direction.", "ADZW's stock prices have been displaying fluctuations, sparking curiosity among traders. As market participants \
keep a close eye on the financial indicators, \
it remains uncertain whether external economic factors or internal restructuring \
are contributing to this trend.", "The stock of ADZW is witnessing a turbulent period, raising \
questions about their competitive position and overall financial health. Potential market shocks or regulatory challenges may \
be looming, keeping investors on edge.", "Investors are closely monitoring ADZW's stock as it exhibits signs of \
instability, potentially indicating a shift in industry dynamics. The market awaits crucial updates from the company's executives, who may provide insights \
into their future strategies and initiatives.", "ADZW's stock has recently experienced a downtrend, prompting analysts to delve into potential reasons behind this \
development. Speculation revolves around factors such as declining sales figures, management changes, \
or disruptions in their supply chain.", "Traders are closely watching ADZW's stock amid rumours of management changes and potential corporate restructuring. The market is awaiting official statements \
that might shed light on the company's future direction.", "A sense of uncertainty surrounds ADZW's stock as it undergoes a period of price fluctuations. Industry insiders\
speculate on potential mergers, acquisitions, or \
divestitures that might be impacting the stock's performance.", "ADZW workers have reportedly gone on strike to protest the poor working conditions of the company, leading market analysts to theorize on the potential \
affect this will have on company stock prices.", "The latest ADZW product has been all but 'a great failure', one market analyst reports.", "Supply chain problems have wreacked havoc on industries across \
the globe, causing supplies to fall short."]
var up_news = ["Investors are eagerly taking notice of ADZW's recent stock movements, \
hinting at a potential shift in market sentiment. Positive industry chatter and favourable rumours surround the company, \
sparking curiosity about its future prospects.", "The stock of ADZW has been displaying signs of \
resilience amidst market turbulence, leaving traders intrigued about the underlying \
reasons driving this unexpected performance.", "Market analysts are closely monitoring ADZW's stock as it \
shows notable fluctuations, raising questions about the factors influencing its trajectory and \
potential implications for the company's future.", "Rumours of favourable corporate developments are circulating, \
leading to heightened interest in ADZW's stock. Investors are cautiously optimistic as they await official announcements \
that may shed light on the company's growth potential.", "ADZW's stock has been gradually gaining traction, creating a buzz among market \
participants who are keen to decipher \
the hidden catalysts behind this upward movement.", "The company's strong fundamentals and promising future prospects are subtly reflected in the stock's movement, igniting \
speculation about potential catalysts poised to propel it further.", "Market whispers allude to a shift in investor \
sentiment towards ADZW, with speculation rife about undisclosed \
business ventures that may be influencing the stock's positive movement.", "ADZW has acquired many new companies, leading it to, once again, be in the market spotlight.", "ADZW's new product \
is a runaway success, with over 5 million \
units sold in the first weekend of its release!", "ADZW's new marketing tactics appear to be reeling in new customers, a new report shows."]
var neutral_news = ["Market watchers are patiently awaiting any catalysts that could potentially nudge ADZW's \
stock in a specific direction. External factors, such as macroeconomic developments or industry trends, may eventually sway \
investor sentiment and impact the stock's trajectory.", "Despite recent market fluctuations, ADZW's stock has managed to maintain a \
relatively neutral position. The company's ability to navigate uncertainties and adapt to changing market dynamics may \
play a crucial role in determining its future performance.", "Investors are closely monitoring ADZW's stock as \
it hovers around a neutral stance. Market experts suggest that forthcoming financial reports and quarterly earnings could \
provide crucial insights into the company's current state.", "ADZW's stock appears to be in a holding pattern, with trading volumes remaining \
steady. As market participants exercise caution, they seek \
concrete signals before taking decisive actions.", "Neutral price movements in ADZW's stock indicate a state of \
balance between buyers and sellers. The company's upcoming product releases or strategic decisions could be \
potential drivers of change in this equilibrium.", "ADZW's stock has experienced limited fluctuations recently, leaving traders cautious about \
making significant moves. The company's ability to deliver \
on its promises and meet market expectations will likely influence future stock movements.", "ADZW's stock has found a stable footing, with investors carefully weighing the balance \
of risks and rewards. The company's performance in \
the face of evolving market challenges may influence future sentiment.", "ADZW has not announced any new projects for the upcoming fiscal year, reports show."]

func _process(delta):
	tab = get_parent().get_node("Tabs").current_tab
	if tab == 0:
		add_theme_font_size_override("font_size", 100)
		text = "Day " + str(Global.day) + " : $" + str(Global.stock_price)
		if Global.m_value > 0:
			add_theme_color_override("font_color", Color(0.258823543787, 0.69019609689713, 0))
		elif Global.m_value < 0:
			add_theme_color_override("font_color", Color(0.78823530673981, 0, 0.11372549086809))
		elif Global.m_value == 0:
			add_theme_color_override("font_color", Color(0.29411765933037, 0.29411765933037, 0.29411765933037))
	elif tab == 1:
		add_theme_color_override("font_color", Color(1, 1, 1))
		add_theme_font_size_override("font_size", 25)
		if text == "":
			get_news()
		text = story

func get_news():
	random.randomize()
	var num = random.randi_range(0, 7)
	if news == false:
		if Global.next_m_value > 0:
			story = """ADZW NEWS
			""" + up_news[num]
		elif Global.next_m_value < 0:
			story = """ADZW NEWS
			""" + down_news[num]
		elif Global.next_m_value == 0:
			story = """ADZW NEWS
			""" + neutral_news[num]
		news = true

func _on_buy_stock_pressed():
	if Global.player_cash >= Global.stock_price:
		Global.player_stocks += 1
		Global.player_cash -= Global.stock_price

func _on_sell_stock_pressed():
	if Global.player_stocks > 0:
		Global.player_stocks -= 1
		Global.player_cash += Global.stock_price
