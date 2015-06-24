class SearchMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.search_mailer.report.subject
  #
  def report(user_search, user_email)
    @greeting = "Hi"
    @assembly = Assembly.find_by_name(user_search)
    @hits = Hit.where(subject_id: Gene.where(
        sequence_id: Sequence.where(
        assembly_id: Assembly.where(
        name: user_search)))).order(percent_similarity: :desc)
    mail to: "#{user_email}"
  end
end
