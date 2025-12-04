(lambda set-opt [field val]
  (tset vim.opt field val))

(lambda set-o [field val]
  (tset vim.o field val))

(lambda set-g [field val]
  (tset vim.g field val))

(lambda set-keymap [...]
  (vim.keymap.set ...))

;; Clipboard
(vim.schedule #(set-opt :clipboard :unnamedplus))

(set-g :mapleader " ")
(set-g :maplocalleader " ")

;; tabs
(set-o :expandtab true)
(set-o :tabstop 4)
(set-o :shiftwidth 4)

(set-g :have_nerd_font true)

;; Make line numbers default
(set-opt :number true)
(set-opt :relativenumber true)

(set-opt :mouse :a)

;; ЙЦУКЕН
(set-o :langmap (table.concat ["ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                               "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"]
                              ","))

;; Don't show the mode, since it's already in the status line
;; (set-opt :showmode false)

;; Enable break indent
(set-opt :breakindent true)

;; Save undo history
(set-opt :undofile true)

;; Case-insensitive searching UNLESS \C or one or more capital letters in the search term
(set-opt :ignorecase true)
(set-opt :smartcase true)

;; Keep signcolumn on by default
(set-opt :signcolumn :yes)

;; Decrease update time
(set-opt :updatetime 250)

;; Decrease mapped sequence wait time
;; Displays which-key popup sooner
(set-opt :timeoutlen 300)

;; Configure how new splits should be opened
(set-opt :splitright true)
(set-opt :splitbelow true)

;; Sets how neovim will display certain whitespace characters in the editor.
;;  See `:help 'list'`
;;  and `:help 'listchars'`
(set-opt :list true)
(set-opt :listchars {:tab "» " :trail "·" :nbsp "␣"})

;; Preview substitutions live, as you type!
(set-opt :inccommand :split)

;; Show which line your cursor is on
(set-opt :cursorline true)

;; Minimal number of screen lines to keep above and below the cursor.
(set-opt :scrolloff 10)

;; Spellcheck
(set-opt :spell true)
(set-opt :spelllang [:en_us :ru_yo])

;; [[ Basic Keymap ]]
;; Clear highlights on search when pressing <Esc> in normal mode
;;  See `:help hlsearch`
(set-keymap :n :<Esc> :<cmd>nohlsearch<CR>)

;; go to the beginning/end
(set-keymap :n :L "$" {:noremap true})
(set-keymap :n :H "^" {:noremap true})
;; cyrillic
(set-keymap :n "Д" "$" {:noremap true})
(set-keymap :n "Р" "^" {:noremap true})

;; Diagnostic keymaps
(set-keymap :n :<leader>q vim.diagnostic.setloclist
            {:desc "Open diagnostic [Q]uickfix list"})

;; Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
;; for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
;; is not what someone will guess without a bit more experience.
;;
;; NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
;; or just use <C-\><C-n> to exit terminal mode
(set-keymap :t :<Esc><Esc> "<C-\\><C-n>" {:desc "Exit terminal mode"})

;; Highlight when yanking (copying) text
(vim.api.nvim_create_autocmd :TextYankPost
                             {:desc "Highlight when yanking (copying) text"
                              :group (vim.api.nvim_create_augroup :highlight-yank
                                                                  {:clear true})
                              :callback #(vim.highlight.on_yank)})

(let [lazy (require :lazy)]
  (lazy.setup {1 :tpope/vim-sleuth
               2 {1 :blazkowolf/gruber-darker.nvim
                  :priority 1000
                  :init #(do
                           (vim.cmd.colorscheme :gruber-darker)
                           (vim.cmd.hi "Comment gui=none"))}
               3 {:import :plugins}
               :checker {:enabled true}}))
