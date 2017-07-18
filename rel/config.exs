# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :umbrella_test,
    # This sets the default environment used by `mix release`
    default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"V=N<E4/T>ZZSP01kEyd~BXg&s@@/F_6OHSq>1e5V@!b|;KeT6tr`a^WK8Wz`i:ly"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"/bkRr)Ya/p?Epnmqwrn]Yq*0z7mjG{kLc;I,N?X?AdVs=kPUKwLOBc7v}GSa[|ue"
  # set output_dir: "apps/umbrella_test_master/rel/umbrella_test_master"
  set output_dir: "rel/umbrella_test"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :umbrella_test do
  set version: "0.1.1"
  set applications: [
    :runtime_tools,
    app1: :permanent,
    app2: :permanent
  ]
end

release :app1 do
  set version: current_version(:app1)
end

release :app2 do
  set version: current_version(:app2)
end

# release :umbrella_test_master do
#   set version: current_version(:umbrella_test_master)
# end
