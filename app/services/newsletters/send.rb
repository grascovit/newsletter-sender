# frozen_string_literal: true

module Newsletters
  class Send
    def initialize(newsletter)
      @newsletter = newsletter
    end

    def call
      response = HTTParty.post(email_sending_url, request_options)
      success = JSON.parse(response.body)['success']

      success && @newsletter.update(sent_at: Time.current)
    end

    private

    def email_sending_url
      "#{ENV['MAILER_API_URL']}/email/send"
    end

    def request_options
      {
        body: {
          apikey: ENV['MAILER_API_KEY'],
          msgFrom: @newsletter.sender.email,
          msgFromName: @newsletter.sender.name,
          msgTo: @newsletter.list.recipients.pluck(:email).join(','),
          subject: @newsletter.title,
          bodyText: Nokogiri::HTML(@newsletter.body).text,
          bodyHtml: @newsletter.rendered_body
        }
      }
    end
  end
end
