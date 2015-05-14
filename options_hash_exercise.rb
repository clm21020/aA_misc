def super_print(str, options = {})
  defaults = {
    :times => 1,
    :upcase => false,
    :reverse => false
  }
  options = defaults.merge(options)

  str *= (options[:times])
  str.upcase! if options[:upcase]
  str.reverse! if options[:reverse]

  str
end
