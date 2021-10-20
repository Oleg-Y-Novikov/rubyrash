class CreateHash

  #def self.email_hash
    #@email_hash
  #end

  attr_reader :email_hash

  def initialize(email)
    @email_hash = Hash.new
    @email_hash[:subject] = email.subject
    @email_hash[:body] = email.body
    @email_hash[:to] = email.send_to
    @email_hash[:from] = email.my_mail
    @email_hash[:via] = :smtp
    @email_hash[:via_options] = {
      :address => 'smtp.mail.ru',
      :port => '465',
      :tls => true,
      :user_name => email.my_mail,
      :password => email.password,
      :authentication => :plain
    }
  end

end
