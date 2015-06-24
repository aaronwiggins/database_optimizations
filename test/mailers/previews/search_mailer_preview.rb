# Preview all emails at http://localhost:3000/rails/mailers/search_mailer
class SearchMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/search_mailer/report
  def report
    SearchMailer.report
  end

end
