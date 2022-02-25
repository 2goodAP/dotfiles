(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(lsp-mode lsp-ui ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Add the melpa package repository
(require 'package)

(add-to-list
 'package-archives '("melpa" . "https://melpa.org/packages/")
 )


;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; Enable ligatures in programming modes                                                           
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\"
                                     "\\\\\\" "{-" "::" ":::" ":=" "!!" "!="
                                     "!==" "-}" "----" "-->" "->" "->>" "-<"
                                     "-<<" "-~" "#{" "#[" "##" "###" "####"
                                     "#(" "#?" "#_" "#_(" ".-" ".=" ".." "..<"
                                     "..." "?=" "??" ";;" "/*" "/**" "/="
                                     "/==" "/>" "//" "///" "&&" "||" "||="
                                     "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:="
                                     "==" "===" "==>" "=>" "=>>" "<=" "=<<"
                                     "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>="
                                     ">>>" "<*" "<*>" "<|" "<|>" "<$" "<$>"
                                     "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
                                     "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<="
                                     "<<<" "<~" "<~~" "</" "</>" "~@" "~-"
                                     "~>" "~~" "~~>" "%%"))

(global-ligature-mode 't)
