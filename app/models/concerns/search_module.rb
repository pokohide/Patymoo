module SearchModule
  extend ActiveSupport::Concern

  included do
    scope :like, ->(q) {
      where('name like ?', "%#{q}%") if q.present?
    }
    scope :asc, -> { order(open_date: :asc) }
  end
end
