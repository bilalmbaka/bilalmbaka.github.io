import experience from '../data/experience.json'
import Section from './Section'

export default function Experience() {
  return (
    <Section
      id="experience"
      title="Work Experience"
      subtitle="Where I've worked and what I've built."
    >
      <div className="timeline">
        {experience.map((job, i) => (
          <article className="timeline-item" key={i}>
            <div className="timeline-dot" />
            <div className="timeline-card">
              <div className="timeline-head">
                <h3>{job.role}</h3>
                <span className="timeline-period">{job.period}</span>
              </div>
              <p className="timeline-company">
                {job.company}
                {job.location && <> · {job.location}</>}
              </p>
              {job.summary && <p className="timeline-summary">{job.summary}</p>}
              {job.points?.length > 0 && (
                <ul className="timeline-points">
                  {job.points.map((point, j) => (
                    <li key={j}>{point}</li>
                  ))}
                </ul>
              )}
            </div>
          </article>
        ))}
      </div>
    </Section>
  )
}
