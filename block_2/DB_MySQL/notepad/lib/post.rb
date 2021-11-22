class Post
  SELECT = <<~SQL.strip
    SELECT * FROM post;
  SQL

  UPDATE = <<~SQL.strip
    UPDATE post SET %<field>s = '%<value>s' WHERE post_id = %<post_id>d
  SQL

  DELETE = <<~SQL.strip
    DELETE FROM post WHERE post_id = %<post_id>d;
  SQL

  def self.post_types
    { "Memo" => Memo, "Task" => Task, "Link" => Link }
  end

  def self.post_action
    %i[create read update delete]
  end

  def self.create(type)
    post_types[type].new
  end

  attr_reader :config

  def initialize
    @created_at = Time.now.strftime "%Y-%m-%d %H:%M:%S"
    @text = []
  end

  def save_db
    client = connection_db
    client.query(format(self.class.const_get(:INSERT), self.db_hash))
    client.close
  end

  def delete_db(attrs)
    client = connection_db
    client.query(format(DELETE, attrs))
    client.close
  end

  def read_db
    client = connection_db
    result = client.query(format(self.class.const_get(:SELECT)))
    result.each do |row|
      puts row # "#{row['post_id']} #{row['type']} #{row['created_at']} #{row['text']} #{row['url']} #{row['due_date']}"
    end
    client.close
  end

  def update_db(attrs)
    client = connection_db
    client.query(format(UPDATE, attrs))
    client.close
  end

  def save
    file = File.new(file_path, 'w:UTF-8')

    to_strings.each { |string| file.puts(string) }

    file.close
  end

  def file_path
    case self.class.name
    when "Link" then current_path = "#{__dir__}/../link"
    when "Memo" then current_path = "#{__dir__}/../memo"
    when "Task" then current_path = "#{__dir__}/../task"
    else current_path = File.dirname(__FILE__)
    end

    file_time = @created_at.strftime('%Y-%m-%d_%H-%M-%S')

    "#{current_path}/#{self.class.name}_#{file_time}.txt"
  end

  def read_config
    file = File.read("#{__dir__}/../config/config.json")

    @config = JSON.parse(file)
  end

  def connection_db
    read_config
    Mysql2::Client.new(
      host: config["host"],
      username: config["username"],
      database: config["database"],
      password: config["password"]
    )
  end

  def db_hash
    { type: self.class.name, created_at: @created_at }
  end
end
