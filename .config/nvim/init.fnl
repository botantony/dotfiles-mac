(macro set-opt [field val]
  `(tset vim.opt ,field ,val))

(macro set-o [field val]
  `(tset vim.o ,field ,val))

(macro set-g [field val]
  `(tset vim.g ,field ,val))

(macro set-keymap [...]
  `(vim.keymap.set ,...))

(macro table-concat* [xs_ sep_]
  (let [xs xs_
        sep sep_
        out (table.concat xs sep)]
    `,out))

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
(set-o :langmap (table-concat* ["ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ"
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

(each [_ mode (ipairs [:n :v])]
  (set-keymap mode :L "$" {:noremap true})
  (set-keymap mode :H "^" {:noremap true})
  (set-keymap mode "Д" "$" {:noremap true})
  (set-keymap mode "Р" "^" {:noremap true})
  (set-keymap mode :<leader>d "\"_d"))

(set-keymap :x :<leader>p "\"_dP")

;; Move blocks of code in visual mode
(set-keymap :v :J ":m '>+1<CR>gv=gv")
(set-keymap :v :K ":m '<-2<CR>gv=gv")

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

(local theme-options
       [{1 :blazkowolf/gruber-darker.nvim
         :priority 1000
         :init #(do
                  (vim.cmd.colorscheme :gruber-darker)
                  (vim.cmd.hi "Comment gui=none"))}])

(local one-line-plugins [theme-options
                         :tpope/vim-sleuth
                         :leafo/moonscript-vim
                         :tjdevries/present.nvim
                         :godlygeek/tabular
                         :tpope/vim-abolish
                         :vim-utils/vim-man])

(local lazy-setup (let [out one-line-plugins]
                    ;; `plugins` directory
                    (table.insert out {:import :plugins})
                    (tset out :checker {:enabled true})
                    out))

(let [lazy (require :lazy)]
  (lazy.setup lazy-setup))

;; Transparent background
(vim.cmd (table-concat* ["highlight Normal guibg=none"
                         "highlight NonText guibg=none"
                         "highlight Normal ctermbg=none"
                         "highlight NonText ctermbg=none"]
                        "\n"))
