module BadgesHelper
  def badge_header(badge)
    badge.new_record? ? t('.create') : t('.edit')
  end
end
