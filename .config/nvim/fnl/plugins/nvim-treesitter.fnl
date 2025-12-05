{1 :nvim-treesitter/nvim-treesitter
 :build ":TSUpdate"
 :main :nvim-treesitter.configs
 :opts {:ensure_installed [:bash
                           :c
                           :diff
                           :fennel
                           :go
                           :haskell
                           :html
                           :java
                           :javascript
                           :lua
                           :luadoc
                           :markdown
                           :markdown_inline
                           :python
                           :query
                           :ruby
                           :rust
                           :scheme
                           :sql
                           :swift
                           :typescript
                           :vim
                           :vimdoc
                           :latex]
        :auto_install true
        :highlight {:enable true :additional_vim_regex_highlighting [:ruby]}
        :indent {:enable true :disable [:ruby]}}}
