
return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/pCloudDrive/obsidian",
      },
    },

  	templates = {
  	    folder = "~/pCloudDrive/obsidian/Templates/",
  	    date_format = "%Y-%m-%d-%a",
  	    time_format = "%H:%M",
  	},

	-- dailies
	daily_notes = {
		folder = "3 Daily",
		-- Optional, if you want to change the date format for the ID of daily notes.
		date_format = "%Y%m%d",
		-- Optional, if you want to change the date format of the default alias of daily notes.
		alias_format = "%B %-d, %Y",
		-- Optional, default tags to add to each new daily note created.
		default_tags = { "daily-notes" },
		-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
		template = "Templates/dailyToDo.md"
	},

	-- Optional, if you keep notes in a specific subdirectory of your vault.
  	notes_subdir = "0 Zettelkasten",
	-- Where to put new notes. Valid options are
  	--  * "current_dir" - put new notes in same directory as the current buffer.
  	--  * "notes_subdir" - put new notes in the default notes subdirectory.
	new_notes_location = "notes_subdir",

	-- new notes title
	note_path_func = function(spec)
		local path = spec.dir / spec.title
		return path:with_suffix(".md")
	end,

	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["gf"] = {
		action = function()
			return require("obsidian").util.gf_passthrough()
		end,
		opts = { noremap = false, expr = true, buffer = true },
		},
		-- Toggle check-boxes.
		["<leader>ch"] = {
		action = function()
			return require("obsidian").util.toggle_checkbox()
		end,
		opts = { buffer = true },
		},
		-- Smart action depending on context, either follow link or toggle checkbox.
		["<cr>"] = {
		action = function()
			return require("obsidian").util.smart_action()
		end,
		opts = { buffer = true, expr = true },
		}
	},

	-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  	completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 2,
	},

	disable_frontmatter = true,
  },
}
