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
                         :kotlin
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
                         :perl
                         :python
                         :query
                         :ruby
                         :rust
                         :scheme
                         :sql
                         :swift
                         :systemverilog
                         :toml
                         :typescript
                         :vim
                         :vimdoc
                         :xml
                         :yaml])

{1 :nvim-treesitter/nvim-treesitter
 :branch :main
 :lazy false
 :build ":TSUpdate"
 :config #(let [ts (require :nvim-treesitter)]
            (ts.install ensure-installed)
            (vim.api.nvim_create_autocmd :FileType
                                         {:pattern ensure-installed
                                          :callback #(vim.treesitter.start)}))}
