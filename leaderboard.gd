extends Node2D

@onready var username = Global.username
@onready var score = Global.final_score

func _ready():
	var json = JSON.stringify({"name":username, "score":score})
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request_completed.connect(_on_http_request_completed)
	$HTTPRequest.request("https://stemisthacks2-1-v5899197.deta.app/leaderboard/add", headers, HTTPClient.METHOD_POST, json)

func _on_http_request_completed(result, response_code, headers, body):
	pass
