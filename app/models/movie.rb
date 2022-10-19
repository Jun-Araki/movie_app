class Movie < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true

  before_save do
    format_url = YoutubeUrlFormatter.format(url)
    if format_url.present?
      self.url = format_url
    else
      # 失敗した場合はバリデーションエラーを出す
      errors.add(:url, "YouTubeのURL以外は無効です")
      throw(:abort)
    end
  end
end
