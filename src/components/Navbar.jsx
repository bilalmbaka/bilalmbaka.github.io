import { useState } from 'react'
import { useJson } from '../utils/useJson'

export default function Navbar() {
  const [open, setOpen] = useState(false)
  const { data: navItems, loading: navLoading } = useJson('nav')
  const { data: profile, loading: profileLoading } = useJson('profile')
  if (navLoading || profileLoading) return null

  const handleNav = (e) => {
    e.preventDefault()
    const href = e.currentTarget.getAttribute('href')
    // Page links (e.g. #/blog) navigate instead of scrolling to a section.
    if (href.startsWith('#/')) {
      window.location.hash = href
      setOpen(false)
      return
    }
    const id = href.slice(1)
    const el = document.getElementById(id)
    if (el) el.scrollIntoView({ behavior: 'smooth' })
    setOpen(false)
  }

  return (
    <header className="navbar">
      <nav className="container nav-inner">
        <a className="nav-logo" href="#top" onClick={handleNav}>
          <span className="nav-logo-brace">{'<'}</span>
          {profile.name}
          <span className="nav-logo-brace">{'/>'}</span>
        </a>

        <button
          className={`nav-toggle ${open ? 'open' : ''}`}
          aria-label="Toggle navigation"
          aria-expanded={open}
          onClick={() => setOpen(!open)}
        >
          <span />
          <span />
          <span />
        </button>

        <ul className={`nav-links ${open ? 'open' : ''}`}>
          {navItems.map((item) => (
            <li key={item.id}>
              <a href={item.page ? `#/${item.page}` : `#${item.id}`} onClick={handleNav}>
                {item.label}
              </a>
            </li>
          ))}
        </ul>
      </nav>
    </header>
  )
}
