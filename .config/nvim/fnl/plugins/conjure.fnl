[{1 :Olical/conjure
  :ft [:clojure :fennel :python :javascript :lua :scheme]
  ;; etc
  :lazy true
  :dependencies [:PaterJason/cmp-conjure]}
 {1 :PaterJason/cmp-conjure
  :lazy true
  :config #(let [cmp (require :cmp)
                 config (cmp.get_config)]
             (table.insert config.sources {:name :conjure})
             (cmp.setup config))}]
