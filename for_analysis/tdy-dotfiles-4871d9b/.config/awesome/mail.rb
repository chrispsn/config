#!/usr/bin/env ruby

require "net/imap"
require "base64"

EMAIL = "my_gmail_name@gmail.com"
PASS = Base64.decode64("my_obfuscated_password")

def get_imap(imap, label)
  imap.select(label)
  value = (imap.search(["NOT","SEEN"])).count do |val|
    val if not nil
  end
  return value
end

imap = Net::IMAP.new("imap.gmail.com","993","true")
imap.login(EMAIL,PASS)
puts "inbox             : #{get_imap(imap, "inbox")}"
puts "aur_notify        : #{get_imap(imap, "aur-notify")}"
puts "aur_general       : #{get_imap(imap, "aur-general")}"
puts "aur_dev           : #{get_imap(imap, "aur-dev")}"
puts "arch_dev_public   : #{get_imap(imap, "arch-dev-public")}"
puts "awesome           : #{get_imap(imap, "awesome")}"
puts "awesome_devel     : #{get_imap(imap, "awesome-devel")}"
puts "freebsd_questions : #{get_imap(imap, "freebsd-questions")}"
puts "pacman_dev        : #{get_imap(imap, "pacman-dev")}"
puts "samuraix          : #{get_imap(imap, "samuraix")}"
puts "vimperator        : #{get_imap(imap, "vimperator")}"
imap.disconnect
