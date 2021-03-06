class InsertSettings < ActiveRecord::Migration[4.2]
  def self.up
    Setting.create(name: "mail_from", value: "zzzmachkickbbb@yahoo.co.jp")
    Setting.create(name: "bcc_recipients", value: "1")
    Setting.create(name: "plain_text_mail", value: "0")
    Setting.create(name: "notified_events", value: "---\n- issue_added\n- issue_updated")
    Setting.create(name: "emails_header", value: "")
    Setting.create(name: "emails_footer", value: "You have received this notification because you have either subscribed to it, or are involved in it.\r\nTo change your notification preferences, please click here: http://hostname/my/account")
  end

  def self.down
    Setting.destroy_all
  end
end
