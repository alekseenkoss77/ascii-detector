# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module AsciiDetector
  def self.root
    File.dirname(__dir__)
  end
end
