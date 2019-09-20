require 'slim'

activate :directory_indexes

set :css_dir,    'assets/stylesheets'
set :images_dir, 'assets/images'
set :js_dir,     'assets/javascripts'

activate :external_pipeline,
  name: :webpack,
  command: build? ? 'yarn run build' : 'yarn run start',
  source: '.tmp/dist',
  latency: 1

page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

# Build-specific configuration
configure :build do
  activate :asset_hash
  activate :gzip
  activate :minify_css
  activate :minify_javascript

  set :relative_links, true
  activate :relative_assets
end
