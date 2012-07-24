class CommunityMailer < ActionMailer::Base
  default from: "info@tipp2.net"

  def community_invitation(address, user, community)
  	@user = user
  	@community = community
  	mail(:to => address, :subject => "Einladung zu tipp2 - dem Fussball Tippspiel")
  end
end
