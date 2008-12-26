# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def self.generate_password
    generate_key(8)
  end
  
  def self.sha1(pass)
    Digest::SHA1.hexdigest("laphrasedelamort#{pass}quitue")
  end

  def self.generate_key(nb=30)
    str=''; nb.times { str += (rand(26)+65).chr };str
  end

end
