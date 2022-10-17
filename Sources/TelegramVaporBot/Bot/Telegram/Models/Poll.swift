
/// This object contains information about a poll.
///
/// SeeAlso Telegram Bot API Reference:
/// [Poll](https://core.telegram.org/bots/api#poll)
public final class Poll: Codable {
    /// Custom keys for coding/decoding `Poll` struct
    public enum CodingKeys: String, CodingKey {
        case id
        case question
        case options
        case totalVoterCount = "total_voter_count"
        case isClosed = "is_closed"
        case isAnonymous = "is_anonymous"
        case type
        case allowsMultipleAnswers = "allows_multiple_answers"
        case correctOptionID = "correct_option_id"
        case explanation
        case explanationEntities = "explanation_entities"
        case openPeriod = "open_period"
        case closeDate = "close_date"
    }

    /// Unique poll identifier
    public var id: String

    /// Poll question, 1-300 characters
    public var question: String

    /// List of poll options
    public var options: [PollOption]

    /// Total number of users that voted in the poll
    public var totalVoterCount: Int

    /// True, if the poll is closed
    public var isClosed: Bool

    /// True, if the poll is anonymous
    public var isAnonymous: Bool

    /// Poll type, currently can be “regular” or “quiz”
    public var type: String

    /// True, if the poll allows multiple answers
    public var allowsMultipleAnswers: Bool

    /// Optional. 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot.
    public var correctOptionID: Int?

    /// Optional. Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters
    public var explanation: String?

    /// Optional. Special entities like usernames, URLs, bot commands, etc. that appear in the explanation
    public var explanationEntities: [MessageEntity]?

    /// Optional. Amount of time in seconds the poll will be active after creation
    public var openPeriod: Int?

    /// Optional. Point in time (Unix timestamp) when the poll will be automatically closed
    public var closeDate: Int?

    public init(
        id: String,
        question: String,
        options: [PollOption],
        totalVoterCount: Int,
        isClosed: Bool,
        isAnonymous: Bool,
        type: String,
        allowsMultipleAnswers: Bool,
        correctOptionID: Int? = nil,
        explanation: String? = nil,
        explanationEntities: [MessageEntity]? = nil,
        openPeriod: Int? = nil,
        closeDate: Int? = nil
    ) {
        self.id = id
        self.question = question
        self.options = options
        self.totalVoterCount = totalVoterCount
        self.isClosed = isClosed
        self.isAnonymous = isAnonymous
        self.type = type
        self.allowsMultipleAnswers = allowsMultipleAnswers
        self.correctOptionID = correctOptionID
        self.explanation = explanation
        self.explanationEntities = explanationEntities
        self.openPeriod = openPeriod
        self.closeDate = closeDate
    }
}
