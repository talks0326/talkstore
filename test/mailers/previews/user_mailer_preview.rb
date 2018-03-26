# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/recruit
  def recruit
    UserMailer.recruit
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/mattching_men
  def mattching_men
    UserMailer.mattching_men
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/mattching_women
  def mattching_women
    UserMailer.mattching_women
  end

end
