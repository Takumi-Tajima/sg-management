require 'openai'

class OpenaiClient
  def initialize
    @client = OpenAI::Client.new(access_token: Rails.application.credentials.open_ai[:secret_access_key])
  end

  def chat_with_openai(message)
    response = @client.chat(
      parameters: {
        model: 'gpt-4',
        # messages: [
        #   { role: 'system', content: '関西弁で回答してください' },
        #   message,
        # ],
        messages: message,
      }
    )

    response.dig('choices', 0, 'message', 'content')

    # role = response.dig('choices', 0, 'message', 'role')
    # content = response.dig('choices', 0, 'message', 'content')

    # { role: role, content: content }
  end
end
