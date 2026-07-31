export default function Section({ id, title, subtitle, children }) {
  return (
    <section id={id} className="section">
      <div className="container">
        <div className="section-head">
          <h2 className="section-title">{title}</h2>
          {subtitle && <p className="section-subtitle">{subtitle}</p>}
        </div>
        {children}
      </div>
    </section>
  )
}
