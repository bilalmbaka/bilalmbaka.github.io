import learning from '../data/learning.json'
import Section from './Section'

export default function Learning() {
  return (
    <Section id="learning" title="Currently Learning" subtitle="Always leveling up.">
      <div className="learning-grid">
        {learning.map((item, i) => (
          <div className="learning-card" key={i}>
            <span className="learning-tag">{item.tag}</span>
            <h3>{item.topic}</h3>
            <p>{item.description}</p>
          </div>
        ))}
      </div>
    </Section>
  )
}
