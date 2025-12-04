{1 :X3eRo0/dired.nvim
 :dependencies [:MunifTanjim/nui.nvim]
 :config #(let [dired (require :dired)]
            (dired.setup {:path_separator "/"
                          :show_banner true
                          :show_icons true
                          :show_hidden true
                          :show_dot_dirs true
                          :show_colors true
                          :keybinds {:dired_enter :<cr>
                                     :dired_back "-"
                                     :dired_up "_"
                                     :dired_rename :r
                                     :dired_create :a
                                     :dired_delete :d
                                     :dired_delete_range :D
                                     :dired_copy :y
                                     :dired_copy_range :Y
                                     :dired_copy_marked :MC
                                     :dired_move :X
                                     :dired_move_range :X
                                     :dired_move_marked :MX
                                     :dired_paste :P
                                     :dired_mark :M
                                     :dired_mark_range :M
                                     :dired_delete_marked :MD
                                     :dired_toggle_hidden "."
                                     :dired_toggle_sort_order ","
                                     :dired_toggle_icons "*"
                                     :dired_toggle_colors :c
                                     :dired_toggle_hide_details "("
                                     :dired_quit :q}}))}
