require_relative 'lib/ascii_detector/version'

Gem::Specification.new do |spec|
  spec.name          = "ascii_detector"
  spec.version       = AsciiDetector::VERSION
  spec.authors       = ["Sergei Alekseenko"]
  spec.email         = ["alekseenkoss@gmail.com"]

  spec.summary       = %q{Brute force text pattern detector}
  spec.description   = %q{Brute force text pattern detector}
  spec.homepage      = "https://github.com/alekseenkoss77/ascii_detector"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alekseenkoss77/ascii_detector"
  spec.metadata["changelog_uri"] = "https://github.com/alekseenkoss77/ascii_detector/tree/master/changelog.md"

  spec.add_runtime_dependency 'zeitwerk'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
