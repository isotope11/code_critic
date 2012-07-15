class ContactMailer < ActionMailer::Base
  default :from => 'code-critic-noreply@isotope11.com'

  def review_request(rr, email)
    @review_request = rr
    mail(:to => email, :subject => 'You have a review request that needs attention')
  end
end
