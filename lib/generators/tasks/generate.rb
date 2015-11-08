require 'bundler/setup'
require 'json-schema'
require 'erubis'

namespace :api do
  desc "update"
  task :update, [:api_name] do |task, args|
    Dir.chdir root
    sh "git submodule update --init --recursive"
    sh "git submodule foreach git pull origin master"
    Rake::Task["api:generate"].execute(args)
    sh "git add lib/slack/endpoint.rb"
    sh "git add lib/slack/endpoint/"
    sh "git add slack-api-docs"
    sh "git commit -m 'rake api:update'"
  end

  desc "Generate"
  task :generate, [:api_name] do |task, args|
    jsons = File.expand_path 'slack-api-docs/methods/*.json', root
    schema_path = File.expand_path "lib/generators/schema.json", root
    schema = JSON.parse(File.read(schema_path))

    data = Dir.glob(jsons).each_with_object({}) do |path, result|
      name = File.basename(path, ".json")
      prefix, name = name.split(".")
      next if prefix == "rtm"
      result[prefix] ||= {}

      parsed = JSON.parse(File.read(path))
      JSON::Validator.validate(schema, parsed, :insert_defaults => true)
 
      result[prefix][name] = parsed

    end

    generate_methods(data, args)
    generate_endpoint(data)
  end

  desc "Cleanup"
  task :clean do
    outdir = File.expand_path "lib/slack/endpoint", root
    FileUtils.rm_rf outdir

    outpath = File.expand_path "lib/slack/endpoint.rb", root
    FileUtils.rm_rf outpath
  end

  def generate_endpoint(data)
    templete_path = File.expand_path 'lib/generators/templates/endpoint.rb.erb', root
    templete = Erubis::Eruby.new(File.read(templete_path))

    outpath = File.expand_path "lib/slack/endpoint.rb", root
    FileUtils.rm_rf outpath
    File.write outpath, templete.result(files: data.keys)
  end

  def generate_methods(data, opts)
    templete_path = File.expand_path 'lib/generators/templates/method.rb.erb', root
    templete = Erubis::Eruby.new(File.read(templete_path))

    outdir = File.expand_path "lib/slack/endpoint", root
    data.each_with_index do |(group, names), index|
      printf "%2d/%2d %10s %s\n", index, data.size, group, names.keys

      outpath = File.expand_path "#{group}.rb", outdir
      File.delete(outpath) if File.exist?(outpath)
      File.write outpath, templete.result(group: group, names: names)
    end
  end

  def root
    File.expand_path '../../../..', __FILE__
  end
end
