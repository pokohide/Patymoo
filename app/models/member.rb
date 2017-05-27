# == Schema Information
#
# Table name: members
#
#  id                  :integer          not null, primary key
#  admin_id            :integer
#  name                :string(64)       not null
#  email               :string
#  twitter             :string
#  facebook            :string
#  connpass            :string
#  grade               :integer
#  school_type         :integer
#  school_name         :string
#  department          :string
#  phone_number        :string
#  note                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  event_members_count :integer          default(0), not null
#
# Indexes
#
#  index_members_on_admin_id  (admin_id)
#

class Member < ApplicationRecord
  ALLOWED_PARAMS = [:id, :_destroy, :name, :email, :twitter, :facebook,
    :connpass, :grade, :school_type, :school_name, :department, :phone_number, :note]

  enum grade: { at_first: 1, at_second: 2, at_third: 3,
    at_fourth: 4, at_fifth: 5, at_sixth: 6, adult: 7 }
  enum school_type: { nursery: 1, kindergarten: 2, elementary: 3,
    middle: 4, senior_high: 5, university: 6, vocanical: 7 }
  # See: config/ja.yml

  # Validates

  # References
  belongs_to :admin
  counter_culture :admin
  has_many :event_members, dependent: :destroy
  has_many :events, through: :event_members

  # Scope
  scope :like, ->(q) {
    where('name like ?', "%#{q}%") if q.present?
  }
  scope :asc, -> { order(open_date: :asc) }

  def grades_when type
    case type
    when 'nurcery'
      grades.except :at_fourth, :at_fifth, :at_sixth, :adult
    else
      grades
    end
  end

  def events_count
    self.event_members_count
  end
end
