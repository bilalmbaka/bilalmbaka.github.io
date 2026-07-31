import skills from '../data/skills.json'
import Section from './Section'

export default function Skills() {
  return (
    <Section id="skills" title="Skills" subtitle="Technologies and tools I work with every day.">
      <div className="skills-grid">
        {skills.map((group, i) => (
          <div className="skills-card" key={i}>
            <h3 className="skills-category">{group.category}</h3>
            <div className="skills-chips">
              {group.items.map((skill, j) => (
                <span className="chip" key={j}>
                  {skill}
                </span>
              ))}
            </div>
          </div>
        ))}
      </div>
    </Section>
  )
}
