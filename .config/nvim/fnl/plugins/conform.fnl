;; Autoformat

(macro formatters []
  (let [out {:fennel [:fnlfmt]
             :go [:gofmt]
             :haskell [:stylish-haskell]
             :lua [:stylua]
             :python [:ruff_fix :ruff_format :ruff_organize_imports]
             :rust [:rustfmt]}
        prettier-list [:javascript :css :html :json :yaml]]
    (each [_ v (ipairs prettier-list)]
      (tset out v [:prettier]))
    `,out))

(macro list->map [xs]
  (var out [])
  (each [_ v (ipairs xs)]
    (tset out v true))
  `,out)

;; Disable "format_on_save lsp_fallback" for languages that don't
;; have a well standardized coding style. You can add additional
;; languages here or re-enable it for the disabled ones.
{1 :stevearc/conform.nvim
 :event [:BufWritePre]
 :cmd [:ConformInfo]
 :keys [{1 :<leader>f
         2 #(let [conform (require :conform)]
              (conform.format {:async true :lsp_format :fallback}))
         :mode ""
         :desc "[F]ormat buffer"}]
 :opts {:notify_on_error false
        :format_on_save #(let [disable-filetypes (list->map [:c :cpp])
                               lsp-format-opt (if (. disable-filetypes
                                                     (. (. vim.bo $1) :filetype))
                                                  :never
                                                  :fallback)]
                           {:timeout_ms 500 :lsp_format lsp-format-opt})
        :formatters_by_ft (formatters)}}
