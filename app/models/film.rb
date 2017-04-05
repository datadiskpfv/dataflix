class Film < ActiveRecord::Base

  belongs_to :genre1, class_name: 'Genre'
  belongs_to :genre2, class_name: 'Genre'
  belongs_to :rating

  has_many :rental_lists
  has_many :users, through: :rental_lists
  #accepts_nested_attributes_for :rental_lists

  has_many :previous_films

  mount_uploader :image1, ImageUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :genre1_id, presence: true
  validates :genre2_id, presence: true
  validates :rating_id, presence: true
  #validates :image1, presence: true
  validates :release_year, presence: true
  validates :blu_ray_stock, presence: true

  validates_uniqueness_of :title, :scope => :release_year

  scope :active_t, -> { where(active: true) }
  scope :active_f, -> { where(active: false) }

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts "Film row: #{row['image1']}"
      row['genre1_id'] = Genre.find_by_genre("#{row['genre1_id']}").id
      row['genre2_id'] = Genre.find_by_genre("#{row['genre2_id']}").id
      row['rating_id'] = Rating.find_by_rating("#{row['rating_id']}").id
      row['image1'] = File.open("#{Rails.root}/public/uploads/film_images/#{row['image1']}")
      film = find_by(id: row["id"]) || new
      film.attributes = row.to_hash
      film.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end