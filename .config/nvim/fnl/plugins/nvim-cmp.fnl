; Autocompletion
(macro mappings [cmp-param luasnip-param]
  `(let [cmp# ,cmp-param
         luasnip# ,luasnip-param]
     {;; Select the [n]ext item
      :<C-n> (cmp#.mapping.select_next_item)
      ;; Select the [p]revious item
      :<C-p> (cmp#.mapping.select_prev_item)
      ;; Scroll the documentation window [b]ack / [f]orward
      :<C-b> (cmp#.mapping.scroll_docs -4)
      :<C-f> (cmp#.mapping.scroll_docs 4)
      ;; Accept ([y]es) the completion.
      ;;  This will auto-import if your LSP supports it.
      ;;  This will expand snippets if the LSP sent a snippet.
      :<C-y> (cmp#.mapping.confirm {:select true})
      ;; Manually trigger a completion from nvim-cmp.
      ;;  Generally you don't need this, because nvim-cmp will display
      ;;  completions whenever it has completion options available.
      :<C-Space> (cmp#.mapping.complete {})
      ;; Think of <c-l> as moving to the right of your snippet expansion.
      ;;  So if you have a snippet that's like:
      ;;  function $name($args)
      ;;    $body
      ;;  end
      ;;
      ;; <c-l> will move you to the right of each of the expansion locations.
      ;; <c-h> is similar, except moving you backwards.
      :<C-l> (cmp#.mapping #(if (luasnip#.expand_or_locally_jumpable)
                                (luasnip#.expand_or_jump))
                           [:i :s])
      :<C-h> (cmp#.mapping #(if (luasnip#.locally_jumpable -1)
                                (luasnip#.jump -1))
                           [:i :s])
      ;; For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      ;;    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      }))

{1 :hrsh7th/nvim-cmp
 :event :InsertEnter
 :dependencies [{1 :L3MON4D3/LuaSnip
                 :build (if (or (= (vim.fn.has :win32) 1)
                                (= (vim.fn.executable :make) 0))
                            nil
                            "make install_jsregexp")
                 :dependencies {;; `friendly-snippets` contains a variety of premade snippets.
                                ;;    See the README about individual language/framework/plugin snippets:
                                ;;    https://github.com/rafamadriz/friendly-snippets
                                ;; {
                                ;;   "rafamadriz/friendly-snippets"
                                ;;   :config #(let [module (require "luasnip.loaders.from_vscode")]
                                ;;                 (module.lazy_load))
                                ;; }
                                }}
                :saadparwaiz1/cmp_luasnip
                :hrsh7th/cmp-nvim-lsp
                :hrsh7th/cmp-path]
 :config #(let [cmp (require :cmp)
                luasnip (require :luasnip)]
            (luasnip.config.setup {})
            (cmp.setup {:snippet {:expand #(luasnip.lsp_expand (. $1 :body))}
                        :completion {:completeopt "menu,menuone,noinsert"}
                        :mapping (cmp.mapping.preset.insert (mappings cmp
                                                                      luasnip))
                        :sources [{:name :lazydev
                                   ;; set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                                   :group_index 0}
                                  {:name :nvim_lsp}
                                  {:name :luasnip}
                                  {:name :path}]}))}
