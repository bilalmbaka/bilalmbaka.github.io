import education from '../data/education.json'
import Section from './Section'

export default function Education() {
  return (
    <Section id="education" title="Education" subtitle="My academic background and certifications.">
      <div className="timeline">
        {education.map((item, i) => (
          <article className="timeline-item" key={i}>
            <div className="timeline-dot timeline-dot-accent" />
            <div className="timeline-card">
              <div className="timeline-head">
                <h3>{item.degree}</h3>
                <span className="timeline-period">{item.period}</span>
              </div>
              <p className="timeline-company">
                {item.school}
                {item.location && <> · {item.location}</>}
              </p>
              {item.details && <p className="timeline-summary">{item.details}</p>}
            </div>
          </article>
        ))}
      </div>
    </Section>
  )
}
