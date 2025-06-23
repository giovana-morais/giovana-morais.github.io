# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "simplezinho"
  spec.version       = "0.1.0"
  spec.authors       = ["Giovana Morais"]
  spec.email         = ["giovana.vmorais@gmail.com"]

  spec.summary       = "é simples, mas é trabalho honesto"
  spec.homepage      = "https://giovana-morais.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3"
end
