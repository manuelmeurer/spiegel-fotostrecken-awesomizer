coffeescript_options = {
  input:    '.',
  output:   'extension',
  patterns: [/\A(.+\.coffee)\z/],
  bare:     true
}

guard 'coffeescript', coffeescript_options do
  coffeescript_options[:patterns].each { |pattern| watch(pattern) }
end

guard 'sass', output: 'extension' do
  watch /\A(.+\.scss)\z/
end
