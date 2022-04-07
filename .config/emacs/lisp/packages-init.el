;;; -*- lexical-binding: t; -*-

;; Bootstrap straight.el package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Custom settings for straight.el package manager
(setq straight-check-for-modifications '(check-on-save find-when-checking))


;; Install use-package
(straight-use-package 'use-package)


;; Install and configure garbage collector magic hack
(use-package gcmh
  :straight t
  :config
  (gcmh-mode 1))


;; Install and configure better-defaults
(use-package better-defaults
  :straight t)


;; Install and configure doom-themes
(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one-light t))


;; Install and configure lsp-mode and lsp-ui 
(use-package lsp-mode
  :straight t
  :defer 1
  :hook (prog-mode . lsp))


;; Install and configure company
(use-package company
  :straight t
  :defer 1
  :hook (after-init . global-company-mode))


;; Install and configure flycheck
(use-package flycheck
  :straight t
  :defer 1
  :hook (after-init . global-flycheck-mode))


;; Install and configure rainbow-delimiters
(use-package rainbow-delimiters
  :straight t
  :defer 1
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      :foreground "red"
                      :inherit 'error
                      :box t))


;; Install and configure paredit packages for ELisp
(use-package paredit
  :straight t
  :defer 1)


;; Install and configure ligature.el
(use-package ligature
  :straight (:host github :repo "mickeynp/ligature.el")
  :defer 1
  :config
  ;; Enable the www ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable ligatures in programming modes
  (ligature-set-ligatures
   'prog-mode
   '("++" "--" "/=" "&&" "||" "||=" "->" "=>" "::" "__" "==" "===" "!="
     "=/=" "!==" "<=" ">=" "<=>" "/*" "*/" "//" "///" "<<" "<<<" "<<="
     ">>" ">>>" ">>=" "|=" "^=" "?." "</" "<!--" "-->" "</>" "/>" "##"
     "###" "####" "#####" "######" "---" "----" "-----" "------" "===="
     "=====" "======" "|-" "|--" "|---" "---|" "--|" "-|" "<>" "<~>" "??"
     ".." "..." "=~" "!~" ":=" "..<" "!!" ":::" "=!=" "=:=" "<:<" "..="
     "::<" "#{" "#(" "#_" "#_(" "#?" "#:" ".-" ";;" "~@" "<-" "#{}" "|>"
     "=>>" "=<<" ">=>" "<=<" "=>=" "=<=" "<$" "<$>" "$>" "<+" "<+>" "+>"
     "<*" "<*>" "*>" "<|>" ".=" "#=" "+++" "***" ":>:" ":<:" "<|||" "<||"
     "<|" "||>" "|||>" "[|" "|]" "~-" "~~" "%%" "_|_" "||-" "||=" ":>" ":<"
     ">:" "<:" "::>" "<::" ">::" "|}" "{|" "}#" "::=" "#!" "->>" ">-" ">>-"
     "->-" "->>-" ">>=" "=>>=" ">>->" ">>=>" "|->" "|=>" "~>" "~~>" "//=>"
     "<<-" "-<" "-<<" "-||" "-<-" "-<<-" "<<=" "=|" "=||" "=<<=" "<-<<"
     "<=<<" "<-|" "<=|" "<~" "<~~" "<=//" "<->" "<<=>>" "|-|-|" "|=|=|"
     "/=/" "-|-" "-||-" "=|=" "=||=" "=//="))

  (global-ligature-mode t))


(provide 'packages-init)
;;; packages-init.el ends here
