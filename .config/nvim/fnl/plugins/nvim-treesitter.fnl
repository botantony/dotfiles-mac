(local ensure-installed [:bash
                         :c
                         :c_sharp
                         :clojure
                         :cmake
                         :commonlisp
                         :cpp
                         :dhall
                         :diff
                         :dockerfile
                         :doxygen
                         :elm
                         :elixir
                         :fennel
                         :fsharp
                         :gitcommit
                         :gitignore
                         :go
                         :graphql
                         :haskell
                         :hjson
                         :html
                         :java
                         :javascript
                         :json
                         :latex
                         :lua
                         :luadoc
                         :luau
                         :make
                         :markdown
                         :markdown_inline
                         :meson
                         :ninja
                         :ocaml
                         :python
                         :query
                         :ruby
                         :rust
                         :scheme
                         :sql
                         :swift
                         :toml
                         :typescript
                         :verilog
                         :vim
                         :vimdoc
                         :xml
                         :yaml])

{1 :nvim-treesitter/nvim-treesitter
 :build ":TSUpdate"
 :main :nvim-treesitter.configs
 :opts {:ensure_installed ensure-installed
        :auto_install true
        :highlight {:enable true :additional_vim_regex_highlighting [:ruby]}
        :indent {:enable true :disable [:ruby]}}}
