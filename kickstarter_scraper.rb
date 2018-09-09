require "nokogiri"
require "pry"
# require libraries/modules here

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects_html = kickstarter.css("li.project.grid_4")

  projects = {}
  projects_html.each do |p|
    info = {}

    title = p.css("strong a").text
    info[:image_link] = p.css("img").attribute("src").value
    info[:description] = p.css(".bbcard_blurb").text
    info[:location] = p.css(".location-name").text
    info[:percent_funded] = p.css(".first .funded").text.to_i

    projects[title] = info
  end
  # binding.pry
  projects
end
