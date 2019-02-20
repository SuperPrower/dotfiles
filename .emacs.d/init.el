;; this derective requires `package' library/package/whatever to be loaded at this point.
(require 'package)

;; TODO: figure out what the hell this is
(setq package-enable-at-startup nil)

;; add MELPA to package mirror list
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; TODO: figure out what the hell this is
(package-initialize)

;; ============================

;; disable spacemacs comment background
(setq spacemacs-theme-comment-bg nil)

;; ============================
;; automatically generated shit
;; ============================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-lsp-async t)
 '(company-lsp-enable-snippet t)
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes t)
 '(package-selected-packages
   (quote
    (pdf-tools flycheck lsp-ui elcord magit dashboard yasnippet-snippets projectile yasnippet smart-mode-line cquery emacs-cquery lsp-mode diminish powerline-evil powerline telephone-line company neotree evil-collection spacemacs-theme counsel ivy gruvbox-theme tangotango-theme use-package which-key)))
 '(preview-default-option-list
   (quote
    ("displaymath" "floats" "textmath" "sections" "footnotes")))
 '(spacemacs-theme-comment-bg nil))

;; ============================

;; Install use-package if it's not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; always ensure that packages installed
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; ============================
;; parse and execute config.org
;; ============================
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; ============================
;; automatically generated shit
;; ============================

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed)))))
