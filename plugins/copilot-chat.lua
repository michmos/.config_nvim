
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
		-- Shared config starts here (can be passed to functions at runtime and configured via setup function)
		-- default window options
		window = {
			layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
			width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
			height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
			-- Options below only apply to floating windows
			relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
			border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
			row = nil, -- row position of the window, default is centered
			col = nil, -- column position of the window, default is centered
			title = 'Copilot Chat', -- title of chat window
			footer = nil, -- footer of chat window
			zindex = 1, -- determines if window is on top or below other floating windows
		},

		highlight_headers = false, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
		references_display = 'virtual', -- 'virtual', 'write', Display references in chat as virtual text or write to buffer
		auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
		insert_at_end = true, -- Move cursor to end of buffer when inserting text
		clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

		-- Static config starts here (can be configured only via setup function)
		chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)

		question_header = '# User ', -- Header to use for user questions
		answer_header = '# Copilot ', -- Header to use for AI answers
		error_header = '# Error ', -- Header to use for errors
		separator = '───', -- Separator to use in chat

		-- default prompts
		-- see config/prompts.lua for implementation
		prompts = {
			ExplainSelection = {
			prompt = 'Write an explanation for the selected code as paragraphs of text.',
			system_prompt = 'COPILOT_EXPLAIN',
			},
			ExplainDiag = {
			prompt = 'Explain the issue highlighted by the diagnostics. Explain how to fix it',
			system_prompt = 'COPILOT_REVIEW',
			},
			Review = {
			prompt = 'Review the selected code.',
			system_prompt = 'COPILOT_REVIEW',
			},
			Fix = {
			prompt = 'There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.',
			},
			Optimize = {
			prompt = 'Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.',
			},
			Docs = {
			prompt = 'Please add documentation comments to the selected code.',
			},
			Tests = {
			prompt = 'Please generate tests for my code.',
			},
			Commit = {
			prompt = 'Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.',
			context = 'git:staged',
			},
		},
	},
    -- See Commands section for default commands if you want to lazy load on them
  },
}
