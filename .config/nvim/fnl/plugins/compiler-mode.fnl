{1 :ej-shafran/compile-mode.nvim
 :dependencies [:nvim-lua/plenary.nvim]
 :config #(tset vim.g :compile_mode
                {:error_regexp_table {:rust {:regex "^\\s*--> \\(.\\+\\):\\([1-9][0-9]*\\):\\([1-9][0-9]*\\)"
                                             :filename 1
                                             :row 2
                                             :col 3}}
                 :default_command {:rust "cargo build"
                                   :haskell "cabal build"
                                   :python "pyhton3 %"
                                   :ruby "ruby %"
                                   :lua "lua %"
                                   :javascript "node %"
                                   :typescript "node %"
                                   :c "cc -o %:r %"
                                   :go "go build %"}})}
