class FriendNotifierMailer < ApplicationMailer  
  default :from => 'no-reply@friendsbook.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_mail
    Friend.all.each do |friend|
      if friend.date_of_birth.month == Date.today.month && friend.date_of_birth.day == Date.today.day
        @friend = friend
        
        mail( 
          to: friend.email,
          subject: 'Happy Birthday' 
        )
      end
    end
  end
end
