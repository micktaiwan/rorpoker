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
  
  def invite_users(i,p,from)
    @subject    = "[Poker] #{i.name} invited you on PTM"
    @body["i"] = i
    @body["p"] = p
    @body["from"] = from
    @recipients = i.email
    if from.email != ''
      @from       = from.email
    else
      @from       = 'protask@protaskm.com'
    end
    @sent_on    = Time.now
    @headers    = {}
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
  
  def reminders(u,dates)
    @subject    = "[Poker] Reminders for #{Date.today}"
    @body["u"]  = u
    @body["dates"] = dates
    @recipients = u.email
    @from       = 'protask@protaskm.com'
    @sent_on    = Time.now
    @headers    = {}
  end
  
  def mail_changes(u,text)
    @subject    = "[Poker] New movies"
    @body["u"]  = u
    @body["text"] = text
    @recipients = u.email
    @from       = 'protask@protaskm.com'
    @sent_on    = Time.now
    @headers    = {}
    content_type "text/html"
  end
  
end

