import { useJson } from '../utils/useJson'
import Section from './Section'

export default function Projects() {
  const { data: projects, loading } = useJson('projects')
  if (loading) return null
  return (
    <Section id="projects" title="Projects" subtitle="A selection of things I've worked on.">
      <div className="projects-grid">
        {projects.map((project, i) => (
          <article className="project-card" key={i}>
            <h3 className="project-title">{project.title}</h3>
            <p className="project-desc">{project.description}</p>
            {project.stack?.length > 0 && (
              <div className="project-stack">
                {project.stack.map((tech, j) => (
                  <span className="chip chip-sm" key={j}>
                    {tech}
                  </span>
                ))}
              </div>
            )}
            <div className="project-links">
              {project.links.map((link, j) => (
                <a key={j} href={link.url} target="_blank" rel="noreferrer">
                  {link.label} ↗
                </a>
              ))}
            </div>
          </article>
        ))}
      </div>
    </Section>
  )
}
