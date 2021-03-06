# frozen_string_literal: true

#
# ensure_packages.rb
#
module Puppet::Parser::Functions
  newfunction(:ensure_packages, type: :statement, doc: <<-DOC
    @summary
      Takes a list of packages and only installs them if they don't already exist.

    It optionally takes a hash as a second parameter that will be passed as the
    third argument to the ensure_resource() function.

    @return
      install the passed packages
  DOC
  ) do |arguments|
    raise(Puppet::ParseError, "ensure_packages(): Wrong number of arguments given (#{arguments.size} for 1 or 2)") if arguments.size > 2 || arguments.empty?
    raise(Puppet::ParseError, 'ensure_packages(): Requires second argument to be a Hash') if arguments.size == 2 && !arguments[1].is_a?(Hash)

    if arguments[0].is_a?(Hash)
      if arguments[1]
        defaults = { 'ensure' => 'installed' }.merge(arguments[1])
        if defaults['ensure'] == 'present'
          defaults['ensure'] = 'installed'
        end
      else
        defaults = { 'ensure' => 'installed' }
      end

      Puppet::Parser::Functions.function(:ensure_resources)
      function_ensure_resources(['package', arguments[0].dup, defaults])
    else
      packages = Array(arguments[0])

      if arguments[1]
        defaults = { 'ensure' => 'installed' }.merge(arguments[1])
        if defaults['ensure'] == 'present'
          defaults['ensure'] = 'installed'
        end
      else
        defaults = { 'ensure' => 'installed' }
      end

      Puppet::Parser::Functions.function(:ensure_resource)
      packages.each do |package_name|
        raise(Puppet::ParseError, 'ensure_packages(): Empty String provided for package name') if package_name.empty?
        function_ensure_resource(['package', package_name, defaults])
      end
    end
  end
end

# vim: set ts=2 sw=2 et :
