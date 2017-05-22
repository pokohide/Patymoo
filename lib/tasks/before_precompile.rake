task :build_frontend do
  sh "npm install"
end

Rake::Task["assets:precompile"].enhance(%i(build_frontend))
