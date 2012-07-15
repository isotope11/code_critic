class ContactMailer < ActionMailer::Base
  def review_request(review_request, email)
    default_url_options[:host]
    recipients email
    subject    'You have a review request that needs attention'
    from       'code-critic-noreply@isotope11.com'
    sent_on    Time.now
    body      review_request 
  end
end
