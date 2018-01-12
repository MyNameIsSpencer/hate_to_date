class User < ApplicationRecord
  validates :email, :password_digest, :phone, length: {minimum: 4}
  validates :email, uniqueness: true


  has_many :results
  has_many :messages

  has_secure_password

  geocoded_by :fsa_to_latitude_longitude
  after_validation :geocode

  def fsa_to_latitude_longitude
    return self.fsa
  end

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
