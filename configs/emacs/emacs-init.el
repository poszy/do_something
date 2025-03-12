(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Ensure `use-package` is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; c/ c++ mode

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

;;; end c / C++

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-operandi))
 '(custom-safe-themes
   '("d10c58f4a53b7d4760022fdf67734865c290e40ef5dfa597a653e14b810a7d07"
     "ff46770c9b4bf10b7cc14d88abff11b627e749057548ac50323712c80e133a87"
     "d6a51c6b938fd38874a938fa4b8795ff2f1d0ca491f824a88aa6c46d373e36cf"
     "236b9b9af6ebae43d98b934d27566ddaf9e47bdcb101d945435aeac0e4e9a73d"
     "3001510be1be4a38508ff07633e97b810c0a52c6fa2f4c7153d22cc7596d9172"
     toxi-theme))
 '(package-selected-packages
   '(## bliss-theme dracula-theme flycheck-kotlin kotlin-mode magit
	timu-caribbean-theme toxi-theme treemacs-magit))
 '(warning-suppress-log-types '((emacs))))

;; load thene
(if (display-graphic-p)
    (load-theme 'toxi t)  ;; Theme for GUI mode
  (load-theme 'bliss t))   ;; Theme for terminal mode

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Use whatever the default monospace font is
(setq font-use-system-font t)

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable splash screen
(setq inhibit-startup-screen t)

;;; Completion framework
(unless (package-installed-p 'vertico)
  (package-install 'vertico))

;; Enable completion by narrowing
(vertico-mode t)

;; Improve directory navigation
(with-eval-after-load 'vertico
  (define-key vertico-map (kbd "RET") #'vertico-directory-enter)
  (define-key vertico-map (kbd "DEL") #'vertico-directory-delete-word)
  (define-key vertico-map (kbd "M-d") #'vertico-directory-delete-char))

;; Enable line numbering by default
(global-display-line-numbers-mode t)

;; Automatically pair parentheses
(electric-pair-mode t)

;;; LSP Support
(unless (package-installed-p 'eglot)
  (package-install 'eglot))

;; Enable LSP support by default in programming buffers
(add-hook 'prog-mode-hook #'eglot-ensure)

;;; Inline static analysis

;; Enabled inline static analysis
(add-hook 'prog-mode-hook #'flymake-mode)

;;; Pop-up completion
(unless (package-installed-p 'corfu)
  (package-install 'corfu))

;; Enable autocompletion by default in programming buffers
(add-hook 'prog-mode-hook #'corfu-mode)

;;; DAP Support
(unless (package-installed-p 'dape)
  (package-install 'dape))

;;; Git client
(unless (package-installed-p 'magit)
  (package-install 'magit))

;; Bind the `magit-status' command to a convenient key.
(global-set-key (kbd "C-c g") #'magit-status)

;;; Kotlin Support
(unless (package-installed-p 'kotlin-mode)
  (package-install 'kotlin-mode))

;;; Markdown support
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

;;; Outline-based notes management and organizer

;; Miscellaneous options
(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))
;; (setq confirm-kill-emacs #'yes-or-no-p)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)


;; Set cursor type to underline
(setq-default cursor-type 'hbar)

;; Enable blinking cursor
(blink-cursor-mode 1)
;; Optional: Customize blinking behavior
(setq blink-cursor-blinks 10)  ;; Number of times the cursor blinks before stopping
(setq blink-cursor-interval 0.5)  ;; Seconds between cursor blinks
(setq blink-cursor-delay 0.2)  ;; Delay before cursor starts blinking




;; treemacs
(use-package treemacs
  :ensure t)
(setq treemacs-width 40) ;; Set the width of the Treemacs window
(setq treemacs-is-never-other-window t) ;; Avoid selecting Treemacs window by default
(global-set-key (kbd "<f1>") 'treemacs)

(treemacs-filewatch-mode t)


(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)


;; Kotlin Major Mode
(use-package kotlin-mode
  :after (lsp-mode dap-mode)
  :config
  (require 'dap-kotlin)
  ;; should probably have been in dap-kotlin instead of lsp-kotlin
  (setq lsp-kotlin-debug-adapter-path (or (executable-find "kotlin-debug-adapter") ""))
  :hook
  (kotlin-mode . lsp))


(use-package company
  :init
  (global-company-mode)

  :custom
  ;; set the completion to begin at once
  (company-idle-delay 0)
  (company-echo-delay 0)
  (company-minimum-prefix-length 1)

  :bind
  ;; trigger company to see a list of choices even when nothing is typed
  ([(control return)] . company-complete))


(use-package lsp-mode
  :bind
  ("M-RET" . lsp-execute-code-action))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-doc-position 'at-point))


;; Additional helpers using treemacs
;; (symbols view, errors, dependencies for Java etc.)
(use-package lsp-treemacs
  :after lsp-mode
  :config
  (lsp-treemacs-sync-mode 1))

;; debugger component (for the few times I need it)
(use-package dap-mode
  :after lsp-mode
  :init
  (dap-auto-configure-mode))
