class Student <ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :house, presence: true

  has_many :professor_students
  has_many :professors, through: :professor_students


  def professor_count
    self.professors.count
  end

  def self.alphabetical
    order(name: :asc)
  end
end
