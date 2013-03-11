Gem::Specification.new do |s|
  s.name    = 'totally-osom-tests'
  s.version = '0.0.0'
  s.date    = '2013-03-12'

  s.summary = "Totally awesome testing framework for ruby"
  s.description = "It's gonna be totally awesome!"
  s.licenses = 'MIT'

  s.authors  = ['Nikolay Nemshilov']
  s.email    = 'nemshilov@gmail.com'
  s.homepage = 'http://github.com/MadRabbit/totally-osom-tests'

  s.files = Dir['lib/**/*'] + Dir['test/**/*'] + Dir['bin/**/*']
  s.files+= %w(
    README.md
  )
end
