local M = {}

M.setup = function()
  local present, todo_comments = pcall(require, 'todo-comments')

  if not present then
    return
  end

  todo_comments.setup {
    keywords = {
      TODO = { icon = ' ', color = 'todo' },
      BUG = { icon = ' ', color = 'error' },
      FIXME = { color = 'error' },
      NOTE = { color = 'hint' },
      REVIEW = { icon = ' ', color = 'review' },
      XXX = { icon = ' ', color = 'warning' },
      DEPRECATED = { color = 'disabled' },
      HACK = { color = 'warning' },
    },
    merge_keywords = false,
    colors = {
      error = { '#DC2626' },
      warning = { '#FBBF24' },
      todo = { '#FF8C00' },
      review = { '#3498DB' },
      disabled = { '#474747' },
      hint = { '#10B981' },
      default = { 'Identifier', '#7C3AED' },
    },
  }
end

return M
