import profile from '../data/profile.json'

export default function Footer() {
  const year = new Date().getFullYear()
  return (
    <footer className="footer">
      <div className="container footer-inner">
        <p className="footer-copy">
          © {year} {profile.name}. All rights reserved.
        </p>
        <p className="footer-built">
          Built with <span className="footer-tool">VS Code</span> &{' '}
          <span className="footer-tool">DeepSeek AI</span> 🚀
        </p>
      </div>
    </footer>
  )
}
