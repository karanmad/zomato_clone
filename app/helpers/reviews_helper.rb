module ReviewsHelper

  def unset_review
    @review.update(approve: false)
  end

  def approve_review
    @review.update(approve: true)
  end

end
