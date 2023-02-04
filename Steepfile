# frozen_string_literal: true

D = Steep::Diagnostic

target :lib do
  signature "sig", "sig-private"

  check "lib"
  # TODO: Enable when fixed
  # lib/ruht/element.rb:38:15: [error] Cannot find compatible overloading of
  # │                           method `instance_eval` of type `::Ruht::Element`
  # │ Method types:
  # │   def instance_eval: (::String, ?::String, ?::Integer) -> untyped
  # │                    | [U] () { (self) [self: self] -> U } -> U
  # │
  # │ Diagnostic ID: Ruby::UnresolvedOverloading
  # │
  # └       result = instance_eval(&@child_block)
  #                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ignore "lib/ruht/element.rb"

  configure_code_diagnostics(D::Ruby.strict) # `strict` diagnostics setting
  # configure_code_diagnostics(D::Ruby.lenient) # `lenient` diagnostics setting
  configure_code_diagnostics do |hash| # You can setup everything yourself
    hash[D::Ruby::NoMethod] = :information
  end
end
