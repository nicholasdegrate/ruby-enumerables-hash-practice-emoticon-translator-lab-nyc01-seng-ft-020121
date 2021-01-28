require 'yaml'
require 'pry'
file = YAML.load_file('./lib/emoticons.yml')
puts file.inspect

def load_library(file)
  file = YAML.load_file('./lib/emoticons.yml')
  emoticons = file.each_with_object({}) do |(k, v), emoticons|
    emoticons[k] = Hash[:english, v[0], :japanese, v[1]]
  end 
  emoticons
end

def get_english_meaning(file, j_emoticon)
  emoticons = load_library(file)
  result = "Sorry, that emoticon was not found"
  emoticons.each do |meaning, emotes|
    if j_emoticon == emotes[:japanese]
      result = meaning 
    end
  end
  result
end

def get_japanese_emoticon(file, w_emoticon)
  emoticons = load_library(file)
  result = "Sorry, that emoticon was not found"
  emoticons.each do |meaning, emotes|
    if w_emoticon == emotes[:english]
      result = emotes[:japanese]
    end 
  end 
  result
end