class Post < ApplicationRecord
  VALID_YOUTUBE_LINK_REGEX = /(?:https?:\/\/)?(?:www\.)?youtu\.?be(?:\.com)?\/?.*(?:watch|embed)?(?:.*v=|v\/|\/)([\w\-_]+)\&?/i

  has_many :votes, dependent: :destroy
  has_many :user_votes, through: :votes, source: :user

  belongs_to :user

  validates :link_youtube, presence: true,
    format: { with: VALID_YOUTUBE_LINK_REGEX }
  validates :description, length: { maximum: 1000 }, allow_blank: true

  before_save :get_embed_link_youtube

  scope :order_by_time,->(order) { order(created_at: order) }

  private
  def get_embed_link_youtube
    new_link_youtube = get_youtube_id(link_youtube)
    self.link_youtube = "https://youtube.com/embed/#{new_link_youtube}"
  end

  def get_youtube_id(link)
    id = ''
    url = link.gsub(/(>|<)/i,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
    if url[2] != nil
      id = url[2].split(/[^0-9a-z_\-]/i)
      id = id[0];
    else
      id = url;
    end

    id
  end
end
