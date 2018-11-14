module ApplicationHelper
  def full_title page_title = ""
    base_title = "musicz"
    page_title.blank? ? base_title : page_title + " | " + base_title
  end

  def nav_title page_title = ""
    base_title = "Overview"
    page_title.blank? ? base_title : page_title
  end
end
