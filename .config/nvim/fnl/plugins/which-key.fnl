;; Useful plugin to show you pending keybinds
{1 :folke/which-key.nvim
 :event :VimEnter
 ;; Sets the loading event to 'VimEnter'
 :opts {:icons {;; set icon mappings to true if you have a Nerd Font
                :mappings vim.g.have_nerd_font
                ;; If you are using a Nerd Font: set icons.keys to an empty table which will use the
                ;; default whick-key.nvim defined Nerd Font icons, otherwise define a string table
                :keys (if vim.g.have_nerd_font {}
                          {:Up "<Up> "
                           :Down "<Down> "
                           :Left "<Left> "
                           :Right "<Right> "
                           :C "<C-…> "
                           :M "<M-…> "
                           :D "<D-…> "
                           :S "<S-…> "
                           :CR "<CR> "
                           :Esc "<Esc> "
                           :ScrollWheelDown "<ScrollWheelDown> "
                           :ScrollWheelUp "<ScrollWheelUp> "
                           :NL "<NL> "
                           :BS "<BS> "
                           :Space "<Space> "
                           :Tab "<Tab> "
                           :F1 :<F1>
                           :F2 :<F2>
                           :F3 :<F3>
                           :F4 :<F4>
                           :F5 :<F5>
                           :F6 :<F6>
                           :F7 :<F7>
                           :F8 :<F8>
                           :F9 :<F9>
                           :F10 :<F10>
                           :F11 :<F11>
                           :F12 :<F12>})}
        ;; Document existing key chains
        :spec [{1 :<leader>c :group "[C]ode" :mode [:n :x]}
               {1 :<leader>d :group "[D]ocument"}
               {1 :<leader>r :group "[R]ename"}
               {1 :<leader>s :group "[S]earch"}
               {1 :<leader>w :group "[W]orkspace"}
               {1 :<leader>t :group "[T]oggle"}
               {1 :<leader>h :group "Git [H]unk" :mode [:n :v]}]}}
