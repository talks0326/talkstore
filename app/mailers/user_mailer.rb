class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.recruit.subject
  #
  def recruit(user)
    @user = user
    mail(
      subject: "【トークストア】今日会いたい申込がありました", #メールのタイトル,
      to: user.email
    ) do |format|
      format.text
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.mattching_men.subject
  #
  def mattching_men(user)
    @user = user
    mail(
      subject: "【トークストア】マッチングしました！", #メールのタイトル,
      to: user.email
    ) do |format|
      format.text
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.mattching_women.subject
  #
  def mattching_women(user)
    @user = user
    mail(
      subject: "【トークストア】マッチングしました！", #メールのタイトル,
      to: user.email
    ) do |format|
      format.text
    end
  end
end
