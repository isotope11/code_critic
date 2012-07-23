module ApplicationHelper
  PAGE_SIZE = 10
  def paginate_commits repo
    git_repo = repo.git_repo
    git_repo.commits(nil, PAGE_SIZE, current_paginated_commit_index)
  end

  def commit_pagination_links repo
    git_repo = repo.git_repo
    commit_count = git_repo.commit_count
    total_pages = (commit_count / PAGE_SIZE).ceil
    html = "Showing commits: #{current_paginated_commit_index + 1} - #{current_paginated_commit_index + PAGE_SIZE} out of #{commit_count}<br />"
    (1...total_pages).each do |page|
      if current_paginated_commit_page == page
        html << current_paginated_commit_page.to_s
      else
        html << link_to(page, "?page=#{page}")
      end
    end
    html.html_safe
  end

  def current_paginated_commit_page
    params[:page] ? params[:page].to_i : 1
  end

  def current_paginated_commit_index
    current_paginated_commit_page * PAGE_SIZE - 10
  end
end
