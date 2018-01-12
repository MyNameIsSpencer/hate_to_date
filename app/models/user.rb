class User < ApplicationRecord
  validates :email, :name, presence: true

  validates :email, :password_digest, length: {minimum: 4}
  validates :email, uniqueness: true
  # validates :phone, length: {is: 10}
  # #validates_format_of :phone, :with => /[0-9]{10}/
  # validates :phone, numericality: { only_integer: true }


  has_many :results
  has_many :sent_messages, :class_name=> 'Message', :foreign_key=>'user_id', :dependent=>:destroy
  has_many :recieved_messages, :class_name=> 'Message', :foreign_key=>'receiver_id', :dependent=>:destroy

  has_secure_password


  def match_generator(result)
    all_matches = Hash.new(0.00)
    @other_user_results = Array.new
    @results = Result.all
    @results.each do |other_result|
      if other_result.survey_id == result.survey_id && other_result.user_id != result.user_id
        @other_user_results << other_result
      end
    end
    @other_user_results.each do |survey_result|
      count = 0.00
      survey_result.answers.each_with_index do |each_answer, index|
          if each_answer == result.answers[index]
            count += 1
          end
      end
      compatibility = count /survey_result.answers.length
      all_matches[survey_result.user_id] = compatibility
    end
    return all_matches
  end
end
