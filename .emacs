(setq display-time-interval 1)
(setq display-time-format "%T")
(display-time)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq make-backup-files nil)
(setq quail-japanese-use-double-n t)
(setq visible-bell t)
(require 'skk-setup)
(setq skk-egg-like-newline t)
(setq skk-use-azik t)
(setq skk-azik-keyboard-type 'us101)
(when (>= emacs-major-version 24)
  (when (<= emacs-minor-version 2)
    (require 'cl-lib)
    )
  (if (>= emacs-major-version 28)
    (setq evil-undo-system 'undo-redo)
    (require 'undo-fu)
    (setq evil-undo-system 'undo-fu)
    )
  (require 'evil)
  (evil-mode 1)
  (define-key evil-motion-state-map (kbd ";") 'evil-ex)
  (define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
  )
(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)
(when (eq system-type 'windows-nt)
  (cd (substitute-in-file-name "${USERPROFILE}/Documents"))
  )
(setq quail-japanese-transliteration-rules
'(("b" "あ") ("k" "い") ("j" "う") ("U" "え") ("J" "お")
  ("s" "か") (";" "き") ("h" "く") ("w" "け") ("x" "こ")
  ("v" "さ") ("d" "し") ("z" "す") ("e" "せ") ("q" "そ")
  ("g" "た") ("[" "ち") ("y" "つ") ("r" "て") ("f" "と")
  ("'" "な") ("c" "に") ("P" "ぬ") ("V" "ね") ("i" "の")
  ("a" "は") ("Y" "ひ") ("R" "ふ") ("S" "へ") ("E" "ほ")
  ("H" "ま") ("I" "み") ("N" "む") ("T" "め") ("K" "も")
  ("O" "や")            (":" "ゆ")            ("G" "よ")
  ("D" "ら") ("p" "り") ("m" "る") ("/" "れ") ("M" "ろ")
  ("L" "わ")            ("o" "を")            ("u" "ん")
  ("sl" "が") (";l" "ぎ") ("hl" "ぐ") ("wl" "げ") ("xl" "ご")
  ("vl" "ざ") ("dl" "じ") ("zl" "ず") ("el" "ぜ") ("ql" "ぞ")
  ("gl" "だ") ("[l" "ぢ") ("yl" "づ") ("rl" "で") ("fl" "ど")
  ("al" "ば") ("Yl" "び") ("Rl" "ぶ") ("Sl" "べ") ("El" "ぼ")
  ("aW" "ぱ") ("YW" "ぴ") ("RW" "ぷ") ("SW" "ぺ") ("EW" "ぽ")
  ("Q" "ぁ") ("A" "ぃ") ("Z" "ぅ") ("X" "ぇ") ("C" "ぉ")
  ("n" "っ") ("B" "ゃ") ("F" "ゅ") ("t" "ょ")
  ("," "、") ("." "。") ("l" "゛") ("W" "゜")
  ("{" "「") ("\"" "」") ("<" "・") (">" "ー"))
)
