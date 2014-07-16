BowerRails.configure do |bower_rails|
  # By default options are false
  bower_rails.install_before_precompile = true # invokes rake bower:install before precompilation
  bower_rails.resolve_before_precompile = true # invokes rake bower:resolve before precompilation
  bower_rails.clean_before_precompile = true   # invokes rake bower:clean before precompilation
end
