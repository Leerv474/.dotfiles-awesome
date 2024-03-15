local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  return
end

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup                                                    │
-- ╰──────────────────────────────────────────────────────────╯
todo_comments.setup {
}


