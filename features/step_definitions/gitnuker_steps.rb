include FileUtils

FILES = %w(.vimrc .bashrc .zshrc)

Given(/^a git repo with some test files at "([^"]*)"$/) do |repo_dir|
  @repo_dir = repo_dir
  base_dir = File.dirname(repo_dir)
  dir = File.basename(repo_dir)
  Dir.chdir base_dir do
    rm_rf dir
    mkdir dir
  end

  Dir.chdir repo_dir do
    FILES.each { |_| touch _  }
    sh "git init ."
    sh "git add #{FILES.join(' ')}"
    sh "git commit -a -m 'initial commit'"
  end
end

Then(/^the files should be checked out in the directory "([^"]*)"$/) do |project_dir|
  # Expand ~ to ENV["HOME"]
  base_dir = File.dirname(project_dir)
  base_dir = ENV["HOME"] if base_dir == "~"
  project_dir = File.join(base_dir,File.basename(project_dir))

  File.exist?(project_dir).should == true
  Dir.chdir project_dir do
    FILES.each do |file|
      File.exist?(file).should == true
    end
  end
end

Given(/^a git repo with some files at "(.*?)"$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

Given(/^I have my files cloned to "(.*?)"$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

Given(/^There`s a new file in the git repo$/) do
    pending # express the regexp above with the code you wish you had
end
