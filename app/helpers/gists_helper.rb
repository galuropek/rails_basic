module GistsHelper

  def hash_link(gist)
    link_to gist.url_hash, gist.url, target: "_blank"
  end
end
