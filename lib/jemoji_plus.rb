# frozen_string_literal: true

require "jekyll"
require "gemoji"
require "html/pipeline"

module Jekyll
  class EmojiPlus
    ASSET_HOST_URL = "https://github.githubassets.com"
    ASSET_PATH = "/images/icons/"
    BODY_START_TAG = "<body"
    OPENING_BODY_TAG_REGEX = %r!<body(.*?)>\s*!.freeze

    class << self
      def emojify(doc)
        return unless doc.output =~ HTML::Pipeline::EmojiFilter.emoji_pattern

        doc.output = if doc.output.include? BODY_START_TAG
                       replace_document_body(doc)
                     else
                       src = emoji_src(doc.site.config)
                       filter_with_emoji(src).call(doc.output)[:output].to_s
                     end
      end

      # Public: Create or fetch the filter for the given {{src}} asset root.
      #
      # src - the asset root URL (e.g. https://github.githubassets.com/images/icons/)
      #
      # Returns an HTML::Pipeline instance for the given asset root.
      def filter_with_emoji(src)
        filters[src] ||= HTML::Pipeline.new([
          HTML::Pipeline::EmojiFilter,
        ], :asset_root => src, :img_attrs => { :align => nil })
      end

      # Public: Filters hash where the key is the asset root source.
      # Effectively a cache.
      def filters
        @filters ||= {}
      end

      # Public: Calculate the asset root source for the given config.
      # The custom emoji asset root can be defined in the config as
      # emoji.src, and must be a valid URL (i.e. it must include a
      # protocol and valid domain)
      #
      # config - the hash-like configuration of the document's site
      #
      # Returns a full URL to use as the asset root URL. Defaults to the root
      # URL for assets provided by an ASSET_HOST_URL environment variable,
      # otherwise the root URL for emoji assets at assets-cdn.github.com.
      def emoji_src(config = {})
        if config.key?("emoji_plus") && config["emoji_plus"].key?("host") && config["emoji_plus"].key?("path")
          config_asset_root(config)
        else
          default_asset_root
        end
      end

      # Public: Defines the conditions for a document to be emojiable.
      #
      # doc - the Jekyll::Document or Jekyll::Page
      #
      # Returns true if the doc is written & is HTML.
      def emojiable?(doc)
        (doc.is_a?(Jekyll::Page) || doc.write?) &&
          doc.output_ext == ".html" || (doc.permalink&.end_with?("/"))
      end

      private

      def config_asset_root(config)
        # Ensure that any trailing "/" is trimmed.
        asset_host_url = config["emoji_plus"]["host"].chomp("/")
        # Ensure [asset_path] is start with "/".
        asset_path = config["emoji_plus"]["path"]
        if asset_path.start_with?("/")
          "#{asset_host_url}#{asset_path}"
        else
          "#{asset_host_url}\/#{asset_path}"
        end
      end

      def default_asset_root
        if !ENV["ASSET_HOST_URL"].to_s.empty?
          asset_host_url = ENV["ASSET_HOST_URL"]
        else
          asset_host_url = ASSET_HOST_URL
        end
        # Ensure that any trailing "/" is trimmed.
        asset_host_url = asset_host_url.chomp("/")
        # Ensure [asset_path] is start with "/".
        asset_path = ASSET_PATH
        if asset_path.start_with?("/")
          "#{asset_host_url}#{asset_path}"
        else
          "#{asset_host_url}\/#{asset_path}"
        end
      end

      def replace_document_body(doc)
        src                 = emoji_src(doc.site.config)
        head, opener, tail  = doc.output.partition(OPENING_BODY_TAG_REGEX)
        body_content, *rest = tail.partition("</body>")
        processed_markup    = filter_with_emoji(src).call(body_content)[:output].to_s
        String.new(head) << opener << processed_markup << rest.join
      end
    end
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  Jekyll::EmojiPlus.emojify(doc) if Jekyll::EmojiPlus.emojiable?(doc)
end
