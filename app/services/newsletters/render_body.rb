# frozen_string_literal: true

module Newsletters
  class RenderBody
    def initialize(newsletter)
      @newsletter = newsletter
    end

    def call
      return @newsletter.body unless template

      @newsletter.rendered_body = rendered_body
    end

    private

    def template
      @template ||= @newsletter.template
    end

    def rendered_body
      template.body
              .gsub('%TITLE%', @newsletter.title)
              .gsub('%BODY%', @newsletter.body)
    end
  end
end
