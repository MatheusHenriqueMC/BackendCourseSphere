class AiChatService
  API_URL = 'https://api.anthropic.com/v1/messages'

  def self.chat(course, lessons, user_message)
    system_prompt = build_system_prompt(course, lessons)

    response = HTTParty.post(
      API_URL,
      headers: {
        'Content-Type' => 'application/json',
        'x-api-key' => ENV.fetch('ANTHROPIC_API_KEY'),
        'anthropic-version' => '2023-06-01'
      },
      body: {
        model: 'claude-haiku-4-5-20251001',
        max_tokens: 500,
        system: system_prompt,
        messages: [
          { role: 'user', content: user_message }
        ]
      }.to_json
    )

    parsed = JSON.parse(response.body)
    parsed.dig('content', 0, 'text') || 'Sorry, I could not generate a response.'
  rescue StandardError => e
    "Error: #{e.message}"
  end

  def self.build_system_prompt(course, lessons)
    lesson_list = lessons.map { |l| "- #{l.title} (#{l.status})" }.join("\n")

    <<~PROMPT
      You are a helpful course assistant for the course "#{course.name}".

      Course description: #{course.description || 'No description provided.'}
      Course period: #{course.start_date} to #{course.end_date}
      Course level: #{course.level || 'Not specified'}

      Lessons:
      #{lesson_list.presence || 'No lessons yet.'}

      Answer questions about this course based on the information above.
      Be friendly, concise and helpful. If you don't know something specific,
      say so and suggest what the student could do.
      Respond in the same language the user writes in.
    PROMPT
  end
end