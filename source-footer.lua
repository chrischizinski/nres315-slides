-- Copies a concise `Source:` sentence from Reveal speaker notes into a
-- visible footer. Existing source-note blocks remain the source of truth for
-- earlier decks; this filter supports decks whose citations live in notes.

function Div(div)
  if not div.classes:includes("notes") then
    return nil
  end

  local note_text = pandoc.utils.stringify(div)
  local source = note_text:match("Source:%s*(.-)%.%s+[A-Z]")
    or note_text:match("Source:%s*(.-)%.$")

  if not source then
    return nil
  end

  local footer = pandoc.Div(
    {pandoc.Para({pandoc.Str("Source:"), pandoc.Space(), pandoc.Str(source)})},
    pandoc.Attr("", {"source-note"})
  )

  return {div, footer}
end
