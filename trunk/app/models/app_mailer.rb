class AppMailer < ActionMailer::Base
  
  def alert(title, msg)
    @subject    = '[Poker] ' + title
    @body["msg"] = msg
    @recipients = 'faivrem@gmail.com'
    @from       = 'protask@protaskm.com'
    @sent_on    = Time.now
    @headers    = {}
  end
  
  def lost_password(user,key)
    @subject    = '[Poker] password reset'
    @body["user"] = user
    @body["key"] = key
    @recipients = user.email
    @from       = 'protask@protaskm.com'
    @sent_on    = Time.now
    @headers    = {}
  end
  
  def registration_mail(user)
    @subject    = '[Poker] Bienvenue'
    @body["user"] = user
    @recipients = user.email
    @from       = 'protask@protaskm.com'
    @sent_on    = Time.now
    @headers    = {}
  end
  
  def added_new_player(from,to,pass,group)
    @subject    = "[Poker] #{from.name} added you on Poker Game Manager"
    @body["from"] = from
    @body["to"] = to
    @body["pass"] = pass
    @body["group"] = group
    @recipients = to.email
    @sent_on    = Time.now
    @headers    = {}
    content_type "text/html"
  end
  
  def invite_result(i,txt)
    @subject    = "[Poker] invitation #{txt}"
    @body["i"] = i
    @body["txt"] = txt
    @recipients = i.user.email
    @from       = 'protask@protaskm.com'
    @sent_on    = Time.now
    @headers    = {}
  end
  
end

