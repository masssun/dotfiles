local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- 🇯🇵 日本語対応フォント設定（Nerd Fonts v3.3.0対応）
config.font = wezterm.font_with_fallback {
  'HackGen Console NF',      -- 日本製プログラミングフォント
  'Cica',                     -- もう一つの人気日本製フォント
  'ヒラギノ角ゴシック',        -- macOS標準
  'Noto Sans CJK JP',         -- Linux向け
  'Symbols Nerd Font',        -- アイコン用
}
config.font_size = 14.0
config.use_ime = true  -- 日本語入力必須！
config.ime_preedit_rendering = 'System'  -- 変換中文字をシステムの IME で表示

-- 🎨 人気のカラースキーム
config.color_scheme = 'Tokyo Night Storm'  -- 日本発の人気テーマ
-- 他の人気: 'Dracula', 'Iceberg Dark', 'Ayu Mirage'

-- ✨ 透過とぼかし効果（2025年最新対応）
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

-- 📐 タブバー設定（tmux風）
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false  -- シンプルなタブバー

-- ⌨️ キーバインド（VSCode/Cursorユーザー向けEmacs風）
config.keys = {
  -- ↕️ Emacsスタイルのカーソル移動
  { key = 'a', mods = 'CTRL', action = act.SendKey { key = 'Home' }},  -- 行頭へ
  { key = 'e', mods = 'CTRL', action = act.SendKey { key = 'End' }},   -- 行末へ
  { key = 'p', mods = 'CTRL', action = act.SendKey { key = 'UpArrow' }},    -- 上へ
  { key = 'n', mods = 'CTRL', action = act.SendKey { key = 'DownArrow' }},  -- 下へ
  { key = 'f', mods = 'CTRL', action = act.SendKey { key = 'RightArrow' }}, -- 右へ
  { key = 'b', mods = 'CTRL', action = act.SendKey { key = 'LeftArrow' }},  -- 左へ

  -- 🪟 ペイン操作（シンプルなキーバインド）
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },  -- 垂直分割
  { key = 'd', mods = 'CMD|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },  -- 水平分割
  { key = 'w', mods = 'CMD', action = act.CloseCurrentPane { confirm = true }},  -- ペインを閉じる

  -- 🔄 ペイン間の移動（Option + 矢印キー）
  { key = 'LeftArrow', mods = 'OPT', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'OPT', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'OPT', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'OPT', action = act.ActivatePaneDirection 'Down' },

  -- 🏷️ タブ操作（CMD + 数字）
  { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },  -- 新規タブ
  { key = '1', mods = 'CMD', action = act.ActivateTab(0) },
  { key = '2', mods = 'CMD', action = act.ActivateTab(1) },
  { key = '3', mods = 'CMD', action = act.ActivateTab(2) },
  { key = '4', mods = 'CMD', action = act.ActivateTab(3) },
  { key = '5', mods = 'CMD', action = act.ActivateTab(4) },
  { key = '6', mods = 'CMD', action = act.ActivateTab(5) },
  { key = '7', mods = 'CMD', action = act.ActivateTab(6) },
  { key = '8', mods = 'CMD', action = act.ActivateTab(7) },
  { key = '9', mods = 'CMD', action = act.ActivateTab(8) },

  -- 📋 コピー＆ペースト（標準的なキーバインド）
  { key = 'c', mods = 'CMD', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CMD', action = act.PasteFrom 'Clipboard' },

  -- 🔍 フォントサイズ調整
  { key = '+', mods = 'CMD', action = act.IncreaseFontSize },
  { key = '-', mods = 'CMD', action = act.DecreaseFontSize },
  { key = '0', mods = 'CMD', action = act.ResetFontSize },

  -- 🔎 検索
  { key = 'f', mods = 'CMD', action = act.Search 'CurrentSelectionOrEmptyString' },

  -- 🤖 Claude Code 用設定
  { key = 'Return', mods = 'SHIFT', action = act.SendString '\n' },

  -- 🖥️ フルスクリーン（キーバインド変更）
  { key = 'Return', mods = 'CMD|CTRL', action = act.ToggleFullScreen },
}

-- 🚀 パフォーマンス設定
config.scrollback_lines = 10000
config.enable_wayland = false  -- Linux向け

-- 🎮 GPU使用設定
config.front_end = 'WebGpu'
config.webgpu_power_preference = 'HighPerformance'

-- 🎞️ アニメーション設定
config.animation_fps = 60
config.max_fps = 60

-- 💻 環境変数設定（Claude Code用最適化）
config.set_environment_variables = {
  TERM = 'wezterm',
  LANG = 'ja_JP.UTF-8',
  LC_ALL = 'ja_JP.UTF-8',
}

-- 🔔 Claude Code 通知設定 (ベル音を OS 通知に変換)
wezterm.on('bell', function(window, pane)
  window:toast_notification('Claude Code', 'タスクが完了しました', nil, 4000)
end)

-- 🎯 その他の人気設定
config.audible_bell = "SystemBeep"  -- Claude Code のタスク完了通知用
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 400

return config
