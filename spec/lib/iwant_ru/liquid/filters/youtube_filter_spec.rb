require 'spec_helper'

describe IwantRu::Liquid::Filters::Youtube do
  let(:vid) { 'dQw4w9WgXcQ' }

  context "#youtube_video_embed" do
    it "renders youtube embed code" do
      Liquid::Template.parse("{{ '#{vid}' | youtube_video_embed }}").render.should include("<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/#{vid}?color=white&theme=light\" frameborder=\"0\" allowfullscreen></iframe>")
    end
  end

  context "#youtube_parse" do
    it "correctly parses youtube links" do

      %w(
        http://www.youtube.com/watch?v=
        https://www.youtube.com/watch?v=
        http://www.youtu.be/
        https://www.youtu.be/
        http://youtu.be/
        https://youtu.be/
      ).each do |link|
        Liquid::Template.parse("{{ '#{link+vid}' | youtube_parse }}").render.should include("<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/#{vid}?color=white&theme=light\" frameborder=\"0\" allowfullscreen></iframe>")
      end
    end

    it "correctly parses a youtube url inside text" do
      text = Faker::Lorem.paragraphs

      Liquid::Template.parse("{{ '#{text} http://www.youtube.com/watch?v=#{vid}' | youtube_parse }}").render.should eq("#{text} <div class=\"flex-video\"><iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/#{vid}?color=white&theme=light\" frameborder=\"0\" allowfullscreen></iframe></div>")
    end

    it "correctly pases a youtube link inside text" do
      text = Faker::Lorem.paragraphs

      Liquid::Template.parse("{{ '#{text} <a href=\"http://www.youtube.com/watch?v=#{vid}\" title=\"Roll\">Rick Roll</a>' | youtube_parse }}").render.should eq("#{text} <div class=\"flex-video\"><iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/#{vid}?color=white&theme=light\" frameborder=\"0\" allowfullscreen></iframe></div>")
    end
  end

end
