class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 20, message: "は20字以内で入力してください" }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_date, comparison: { greater_than_or_equal_to: Date.today, message: "は今日以降の日付を選択してください", if: -> { start_date.present? } }
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date, message: "は開始日以降を入力してください", if: -> { start_date.present? && end_date.present? }  }
  validates :memo, length: { maximum: 500, message: "は500字以内で入力してください" }
end
