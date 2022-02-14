class Professor <ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :specialty, presence: true

  has_many :professor_students
  has_many :students, through: :professor_students

  def avg_student_age
    self.students.average(:age).to_f
  end

  def self.alphabetical
    order(name: :asc)
  end
end
