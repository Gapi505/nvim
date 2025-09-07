-- ~/.config/nvim/lua/gapi-nvim-profile/colorscheme_switcher.lua

-- This is where we hold the state. Don't touch this unless you want to break things.
local state = {
  -- Remembers the last theme we set for a *specific* language.
  -- This is the magic for the "sticky" behavior.
  last_applied_lang_theme = nil,
  -- If all else fails, or on startup, we use this.
  -- Make sure this one is set with `lazy = false` in your plugin manager.
  global_default_theme = "tokyodark",
}

local M = {}

-- The main brain of the operation.
-- This function decides what color to paint the walls.
function M.apply_colorscheme()
  -- Map your filetypes to themes here.
  -- If you add a theme, make sure you've actually installed it, genius.
  local theme_map = {
    rust = "kanagawa",
    zig = "gruvbox",
    -- Add more mappings, e.g.,
    -- lua = "catppuccin",
    -- c = "onedark",
  }

  local filetype = vim.bo.filetype
  local chosen_theme

  -- Figure out which theme to use.
  if theme_map[filetype] then
    -- Found a specific theme for this filetype. Use it.
    chosen_theme = theme_map[filetype]
    state.last_applied_lang_theme = chosen_theme -- Remember this choice.
  else
    -- No specific theme. Fall back to the last one or the global default.
    chosen_theme = state.last_applied_lang_theme or state.global_default_theme
  end

  -- If the theme is already active, don't waste time reloading it.
  if vim.g.colors_name == chosen_theme then
    return
  end

  -- Time for some black magic.
  -- We use pcall to safely try and apply the theme.
  -- If it fails, we don't want Neovim to have a seizure.
  local success, err = pcall(vim.cmd.colorscheme, chosen_theme)

  if not success then
    -- Well, you screwed up. The theme is probably not installed or has an error.
    vim.notify(
      "Colorscheme '"
        .. chosen_theme
        .. "' failed to load. Falling back to default.",
      vim.log.levels.ERROR
    )
    -- How the fuck is this working?
    -- It's not, so we fall back.
    pcall(vim.cmd.colorscheme, state.global_default_theme)
    -- Reset this so we don't get stuck trying to load a broken theme.
    state.last_applied_lang_theme = nil
  end
end

-- This sets up the automation. It runs the brain function when you open files.
local function setup_autocmds()
  local group = vim.api.nvim_create_augroup("GapiLanguageSpecificThemes", {
    clear = true,
  })
  vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost" }, {
    group = group,
    pattern = "*",
    callback = M.apply_colorscheme,
    desc = "Apply colorscheme based on filetype",
  })
end

-- Run the setup as soon as this file is required.
setup_autocmds()

-- Just in case you want to call functions from this file elsewhere.
return M
