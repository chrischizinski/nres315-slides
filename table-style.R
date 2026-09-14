# Shared table treatment for NRES 315 Reveal.js slides.
#
# Source this file in a Quarto R chunk, then pass a data.frame to
# nres315_slide_table(). Use simple, header-row tables only; a slide table
# should support the explanation rather than substitute for it.
nres315_slide_table <- function(data, font_size = 24, header_font_size = 26,
                                row_padding = 12, table_width = 920) {
  gt::gt(data) |>
    gt::tab_options(
      table.width = gt::px(table_width),
      table.font.names = c("Atkinson Hyperlegible", "Arial", "sans-serif"),
      table.font.size = gt::px(font_size),
      column_labels.font.size = gt::px(header_font_size),
      column_labels.font.weight = "bold",
      column_labels.background.color = "#e0ebe0",
      column_labels.border.top.style = "solid",
      column_labels.border.top.color = "#2f6b57",
      column_labels.border.top.width = gt::px(4),
      data_row.padding = gt::px(row_padding),
      table_body.hlines.style = "solid",
      table_body.hlines.color = "#c1d2c5",
      table_body.vlines.style = "none",
      table.border.top.style = "none",
      table.border.bottom.style = "none",
      table.border.left.style = "none",
      table.border.right.style = "none"
    )
}
