(use-package fontaine
  :ensure t)
 (setq fontaine-presets
        '((small
           :default-family "Hack"
           :default-weight normal
           :default-height 75
           :fixed-pitch-family nil ; falls back to :default-family
           :fixed-pitch-weight nil ; falls back to :default-weight
           :fixed-pitch-height 1.0
           :variable-pitch-family "Cascadia Code PL"
           :variable-pitch-weight normal
           :variable-pitch-height 1.0
           :bold-family nil ; use whatever the underlying face has
           :bold-weight bold
           :italic-family nil
           :italic-slant italic
           :line-spacing nil)
          (regular
           :default-family "Cascadia Code PL"
           :default-weight normal
           :default-height 100
           :fixed-pitch-family nil ; falls back to :default-family
           :fixed-pitch-weight nil ; falls back to :default-weight
           :fixed-pitch-height 1.0
           :variable-pitch-family "FiraGO"
           :variable-pitch-weight normal
           :variable-pitch-height 1.05
           :bold-family nil ; use whatever the underlying face has
           :bold-weight bold
           :italic-family nil
           :italic-slant italic
           :line-spacing nil)
          (medium
           :default-family "Cascadia Code PL"
           :default-weight semilight
           :default-height 130
           :fixed-pitch-family nil ; falls back to :default-family
           :fixed-pitch-weight nil ; falls back to :default-weight
           :fixed-pitch-height 1.0
           :variable-pitch-family "FiraGO"
           :variable-pitch-weight normal
           :variable-pitch-height 1.05
           :bold-family nil ; use whatever the underlying face has
           :bold-weight extrabold
           :italic-family nil
           :italic-slant italic
           :line-spacing nil)
          (large
           :default-family "Iosevka Comfy"
           :default-weight semilight
           :default-height 160
           :fixed-pitch-family nil ; falls back to :default-family
           :fixed-pitch-weight nil ; falls back to :default-weight
           :fixed-pitch-height 1.0
           :variable-pitch-family "FiraGO"
           :variable-pitch-weight normal
           :variable-pitch-height 1.05
           :bold-family nil ; use whatever the underlying face has
           :bold-weight extrabold
           :italic-family nil
           :italic-slant italic
           :line-spacing nil)
          (presentation
           :default-family "Iosevka Comfy"
           :default-weight semilight
           :default-height 170
           :fixed-pitch-family nil ; falls back to :default-family
           :fixed-pitch-weight nil ; falls back to :default-weight
           :fixed-pitch-height 1.0
           :variable-pitch-family "FiraGO"
           :variable-pitch-weight normal
           :variable-pitch-height 1.05
           :bold-family nil ; use whatever the underlying face has
           :bold-weight extrabold
           :italic-family nil
           :italic-slant italic
           :line-spacing nil)))

;; Set last preset or fall back to desired style from `fontaine-presets'.
