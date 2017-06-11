coffeescript_options = {
  input:    '.',
  output:   'extension',
  patterns: [/\A(.+\.coffee)\z/],
  bare:     true
}

guard 'coffeescript', coffeescript_options do
  coffeescript_options[:patterns].each(&method(:watch))
end

guard 'sass', output: 'extension' do
  watch /\A(.+\.scss)\z/
end
