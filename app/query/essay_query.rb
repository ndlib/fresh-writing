

class EssayQuery

  def self.find(id)
    relation.find(id)
  end


  def self.essay_for_issue_from_url(issue_id, id)
    issue = IssueQuery.find(issue_id)
    issue.essays.friendly.find(id)
  end

  def self.essays_for_issue_and_essay_style(issue_id, essay_style)
    issue = IssueQuery.find(issue_id)
    issue.essays.where(essay_style: essay_style)
  end

  def self.essays_for_issue(issue)
#    relation.where(issue_id: issue.id)
  end


  def self.relation
    Essay.all
  end

end

