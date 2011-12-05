class Github

  def self.authorization_url(redirect)
    Backend.blocking_worker "circle.workers.github/authorization-url", redirect
  end

  def self.fetch_access_token(user, code)
    Backend.start_worker "circle.workers.github/fetch-github-access-token", user._id.to_s, code
  end
end
