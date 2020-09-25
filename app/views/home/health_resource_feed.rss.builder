# encoding: UTF-8

xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "SCI & U Health Resources"
    xml.author "University of Toronto"
    xml.description "SCI Self Management"
    xml.link "https://www.sci-and-u.com"
    xml.language "en"

    @health_resources.each do |health_resource|
      xml.item do
        xml.title health_resource.title
        xml.description health_resource.description
        xml.url health_resource.url
        xml.format health_resource.format
        xml.audience health_resource.audience
        xml.tool_type health_resource.tool_type
        xml.free health_resource.free
        xml.published health_resource.published
        xml.user_id health_resource.user_id
        xml.created_at health_resource.created_at
        xml.updated_at health_resource.updated_at
        xml.department_id health_resource.department_id
        xml.problem_id health_resource.problem_id
        xml.solution_category_id health_resource.solution_category_id
        xml.sponsor_id health_resource.sponsor_id
        xml.attachment health_resource.attachment
      end
    end
  end
end
