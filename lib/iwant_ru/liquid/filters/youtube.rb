module IwantRu
  module Liquid
    module Filters
      module Youtube

        def youtube_parse(input, *args)
          input.gsub(%r{(?:<a[^>]+href=['"])?https?://(?:www\.)?(?:youtube\.(?:com|ru)/watch\?v=|youtu.be/)(?<id>[-_a-z0-9]+)(['"][^<]*(?:</a>)|[^\s]*)}i,
                     youtube_video_embed('\k<id>', args))
        end

        def youtube_video_embed(input, *args)
          options = args_to_options(args)

          width     = options[:width] || '560'
          height    = options[:height] || '315'
          color     = options[:color] || 'white'
          theme     = options[:theme] || 'light'

          %{
          <div class="flex-video"><iframe
            width="#{width}"
            height="#{height}"
            src="http://www.youtube.com/embed/#{input}?color=#{color}&theme=#{theme}&wmode=transparent"
            frameborder="0"
            allowfullscreen></iframe></div>
          }.strip.gsub(/\n/, '').gsub(/\s+/, ' ')
        end

      end

      ::Liquid::Template.register_filter(Youtube)

    end
  end
end
