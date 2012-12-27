class IssueStatusKanbanState < ActiveRecord::Base
  unloadable

  belongs_to  :kanban_state
  belongs_to  :issue_status

  def self.state_id(issue_status_id)
  	rec = IssueStatusKanbanState.where('issue_status_id=?', issue_status_id)
  	return rec.first.kanban_state_id if !rec.first.nil?
  end

  def self.status_id(kanban_state_id)
  	rec = IssueStatusKanbanState.where('kanban_state_id=?', kanban_state_id)
  	return rec.first.issue_status_id if !rec.first.nil?
  end
end


class IssueStatus < ActiveRecord::Base
  unloadable
  has_many :issue_status_kanban_state
  has_many :kanban_state, :through => :issue_status_kanban_state
end
