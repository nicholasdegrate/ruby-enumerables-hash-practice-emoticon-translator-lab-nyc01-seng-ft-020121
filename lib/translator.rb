# require modules here
require "yaml"
file = YAML.load_file("emotionicons.yml")
puts file.inspect

def load_library(file)
  new_file =  YAML.load_file('emotionicons.yml')
  icons = new_file.each_with_object({}) do |(k, v), icons|
    icons[k] = Hash[:English,v[0], :Japanese, v[1]]
  end 
  icons
end

def get_japanese_emoticon(file,j_emotions)
  emotions = load_library(file)
  result = ''
  emotions.each do |meaning, icons|
    if j_emotions == icons[:Japanese]
      result = meaning
    end
  end
  puts result
end

def get_japanese_emoticon(file, w_emoticon)
  emoticons = load_library(file)
  result = "Sorry, that emoticon was not found"
  emoticons.each do |meaning, emotes|
    if w_emoticon == emotes[:english]
      result = emotes[:english]
    end 
  end 
  result
end