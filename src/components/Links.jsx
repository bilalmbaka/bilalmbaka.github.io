import contact from '../data/contact.json'
import Section from './Section'

function Icon({ name }) {
  const paths = {
    github:
      'M12 2C6.48 2 2 6.48 2 12c0 4.42 2.87 8.17 6.84 9.5.5.09.68-.22.68-.48v-1.7c-2.78.6-3.37-1.34-3.37-1.34-.45-1.16-1.11-1.47-1.11-1.47-.91-.62.07-.61.07-.61 1 .07 1.53 1.03 1.53 1.03.9 1.52 2.34 1.08 2.91.83.09-.65.35-1.09.63-1.34-2.22-.25-4.55-1.11-4.55-4.94 0-1.09.39-1.98 1.03-2.68-.1-.25-.45-1.27.1-2.64 0 0 .84-.27 2.75 1.02.8-.22 1.65-.33 2.5-.33.85 0 1.7.11 2.5.33 1.91-1.29 2.75-1.02 2.75-1.02.55 1.37.2 2.39.1 2.64.64.7 1.03 1.59 1.03 2.68 0 3.84-2.34 4.68-4.57 4.93.36.31.68.92.68 1.85V21c0 .27.18.58.69.48C19.14 20.16 22 16.42 22 12c0-5.52-4.48-10-10-10z',
    linkedin:
      'M4.98 3.5C4.98 4.88 3.87 6 2.5 6S0 4.88 0 3.5 1.12 1 2.5 1s2.48 1.12 2.48 2.5zM.5 8h4V24h-4V8zm7.5 0h3.8v2.2h.05c.53-1 1.83-2.2 3.77-2.2 4.03 0 4.78 2.65 4.78 6.1V24h-4v-8.5c0-2.03-.04-4.64-2.83-4.64-2.83 0-3.27 2.2-3.27 4.5V24H8V8z',
    medium:
      'M13.54 12a6.27 6.27 0 01-6.27 6.27A6.27 6.27 0 011 12a6.27 6.27 0 016.27-6.27A6.27 6.27 0 0113.54 12zm6.87 0c0 3.46-1.4 6.27-3.13 6.27S14.15 15.46 14.15 12s1.4-6.27 3.13-6.27 3.13 2.8 3.13 6.27zm3.09 0c0 3.1-.5 5.62-1.1 5.62s-1.1-2.51-1.1-5.62.5-5.62 1.1-5.62 1.1 2.51 1.1 5.62z',
  }
  return (
    <svg viewBox="0 0 24 24" width="22" height="22" fill="currentColor" aria-hidden="true">
      <path d={paths[name]} />
    </svg>
  )
}

export default function Links() {
  return (
    <Section id="contact" title="Let's Connect" subtitle="Find me around the web.">
      <div className="links-grid">
        {contact.links.map((link, i) => (
          <a className="link-card" href={link.url} target="_blank" rel="noreferrer" key={i}>
            <span className="link-icon">
              <Icon name={link.icon} />
            </span>
            <div className="link-body">
              <h3>{link.label}</h3>
              <p className="link-handle">{link.handle}</p>
              <p className="link-desc">{link.description}</p>
            </div>
          </a>
        ))}
      </div>
      <div className="contact-email">
        <a className="btn btn-primary" href={`mailto:${contact.email}`}>
          ✉️ {contact.email}
        </a>
        <button
          className="btn btn-ghost"
          onClick={async () => {
            const { downloadResume } = await import('../utils/generateResume')
            downloadResume()
          }}
        >
          ⬇ Download Resume
        </button>
      </div>
    </Section>
  )
}
