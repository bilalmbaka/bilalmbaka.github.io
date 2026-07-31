import { useJson } from '../utils/useJson'

export default function Hero() {
  const { data: profile, loading } = useJson('profile')
  const handleDownload = async () => {
    const { downloadResume } = await import('../utils/generateResume')
    await downloadResume()
  }

  if (loading) return null
  return (
    <section id="top" className="hero">
      <div className="container hero-inner">
        <p className="hero-eyebrow">
          <span className="hero-dot" /> Hello, I&apos;m
        </p>
        <h1 className="hero-name">{profile.name}</h1>
        <h2 className="hero-role">Full-Stack Mobile App Developer</h2>
        <p className="hero-tagline">{profile.tagline}</p>
        <div className="hero-actions">
          <button className="btn btn-primary" onClick={handleDownload}>
            ⬇ Download Resume
          </button>
          <a className="btn btn-ghost" href="#projects">
            View Projects
          </a>
          <a className="btn btn-ghost" href="#contact">
            Get in Touch
          </a>
        </div>
      </div>
    </section>
  )
}
