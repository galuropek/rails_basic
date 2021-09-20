class GitHubClient

  def initialize
    @octokit_client = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
  end

  def create_gist(params)
    @octokit_client.create_gist(params)
  end
end
