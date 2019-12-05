require 'google/api_client'
require 'optimist'
require 'open-uri'
require 'json'



q_string = 'gucci+mane+met+gala'
api_key = 'AIzaSyCmIgTF16TFvt2wfrspmud-C3psqp3GbwI'

url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + q_string + "&key=" + api_key

aka = open(url).read

parsed_data = JSON.parse(aka)

results = parsed_data.fetch("items").at(0)

result1 = results.fetch("id")

result2 = result1.fetch("videoId")

p result2


