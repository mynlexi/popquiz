require_relative "popquiz_repo"
require_relative "quiz_controller"
require_relative 'router'

csv_file_q = File.join(__dir__, 'popquiz.csv')
q_repository = QuizRepository.new(csv_file_q)
q_controller = QuizController.new(q_repository)

router = Router.new(q_controller)

router.run