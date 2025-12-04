{1 :echasnovski/mini.nvim
 :config #(let [mini-ai (require :mini.ai)
                mini-surround (require :mini.surround)
                mini-statusline (require :mini.statusline)]
            ;; Better Around/Inside textobjects
            ;;
            ;; Examples:
            ;;  - va)  - [V]isually select [A]round [)]paren
            ;;  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            ;;  - ci'  - [C]hange [I]nside [']quote
            (mini-ai.setup {:n_lines 500})
            ;; Add/delete/replace surroundings (brackets, quotes, etc.)
            ;;
            ;; - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            ;; - sd'   - [S]urround [D]elete [']quotes
            ;; - sr)'  - [S]urround [R]eplace [)] [']
            (mini-surround.setup)
            ;; Simple and easy statusline.
            ;;  You could remove this setup call if you don't like it,
            ;;  and try some other statusline plugin
            ;; set use_icons to true if you have a Nerd Font
            (mini-statusline.setup {:use_icons vim.g.have_nerd_font})
            ;; fix bad contrast in normal mode
            (vim.api.nvim_set_hl 0 :MiniStatuslineModeNormal
                                 {:fg "#000000" :bg "#ffdd33" :bold true})
            ;; You can configure sections in the statusline by overriding their
            ;; default behavior. For example, here we set the section for
            ;; cursor location to LINE:COLUMN
            ;; (mini-statusline.section_location #"%2l:%-2v")
            )}
