module ApplicationHelper
  def full_title page_title = ""
    base_title = "musicz"
    page_title.blank? ? base_title : page_title + " | " + base_title
  end

  def sorttable column, title = nil
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end
end
