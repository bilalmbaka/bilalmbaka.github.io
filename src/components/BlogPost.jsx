import { useState } from 'react'
import { useJson } from '../utils/useJson'
import { useMarkdown, noteName } from '../utils/useMarkdown'
import Section from './Section'

function NoteBody({ path }) {
  const { html, loading, error } = useMarkdown(path)
  if (loading) return <p className="blog-note-status">Loading…</p>
  if (error) return <p className="blog-note-error">Could not load {path}</p>
  return (
    <div
      className="blog-note-content"
      dangerouslySetInnerHTML={{ __html: html }}
    />
  )
}

export default function BlogPost() {
  const { data: blog, loading } = useJson('blog')
  const [openPath, setOpenPath] = useState(null)
  const [openCategories, setOpenCategories] = useState(() => new Set()) // all collapsed by default
  if (loading) return null

  const toggleCategory = (index) => {
    setOpenCategories((prev) => {
      const next = new Set(prev)
      if (next.has(index)) next.delete(index)
      else next.add(index)
      return next
    })
  }

  const isCategoryOpen = (index) => openCategories.has(index)

  return (
    <Section
      id="blogpost"
      title="Blog Posts"
      subtitle="Notes and write-ups, organized by topic."
    >
      {blog.map((cat, ci) => {
        const open = isCategoryOpen(ci)
        return (
          <div className="blog-category" key={ci}>
            <button
              className="blog-category-toggle"
              aria-expanded={open}
              onClick={() => toggleCategory(ci)}
            >
              <span className="blog-category-title">
                <span className="blog-brace">{'{'}</span>
                {cat.category}
                <span className="blog-brace">{'}'}</span>
              </span>
              <span className="blog-note-chevron" aria-hidden="true">
                {open ? '−' : '+'}
              </span>
            </button>
            {open && (
              <div className="blog-grid">
                {cat.sections.map((sec, si) => (
                  <div className="blog-card" key={si}>
                    <div className="blog-card-head">
                      <h4 className="blog-topic">{sec.topic}</h4>
                      <span className="blog-count">
                        {sec.notes.length} note{sec.notes.length === 1 ? '' : 's'}
                      </span>
                    </div>
                    <ul className="blog-notes">
                      {sec.notes.map((path, ni) => {
                        const noteOpen = openPath === path
                        return (
                          <li className="blog-note" key={ni}>
                            <button
                              className="blog-note-toggle"
                              aria-expanded={noteOpen}
                              onClick={() => setOpenPath(noteOpen ? null : path)}
                            >
                              <span className="blog-note-name">
                                {noteName(path)}
                              </span>
                              <span className="blog-note-chevron" aria-hidden="true">
                                {noteOpen ? '−' : '+'}
                              </span>
                            </button>
                            {noteOpen && <NoteBody path={path} />}
                          </li>
                        )
                      })}
                    </ul>
                  </div>
                ))}
              </div>
            )}
          </div>
        )
      })}
    </Section>
  )
}
