Gem::Specification.new do |s|
  s.name = 'admin_views'
  s.version = '0.1'
  s.date = '2010-02-22'
  s.authors = ['Conor Hunt']
  s.email = 'conor.hunt@gmail.com'
  s.summary = %q{Rails generator to create admin views for models}
  s.homepage = 'http://github.com/conorh/admin_views'
  s.description = %q{Rails generator to create admin views for models}

  s.files = ['README.md', 'LICENSE', 'Changelog'] + Dir['generators/**/*'].to_a

  s.add_dependency('will_paginate', '>= 2.3.12')
  s.add_dependency('formtastic', '>= 0.9.7')
end